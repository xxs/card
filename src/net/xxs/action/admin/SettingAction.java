package net.xxs.action.admin;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import net.xxs.bean.Setting;
import net.xxs.bean.Setting.CurrencyType;
import net.xxs.bean.Setting.Operator;
import net.xxs.bean.Setting.RoundType;
import net.xxs.bean.Setting.ScoreType;
import net.xxs.bean.Setting.WatermarkPosition;
import net.xxs.service.CacheService;
import net.xxs.service.JobService;
import net.xxs.service.MailService;
import net.xxs.util.ImageUtil;
import net.xxs.util.SettingUtil;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.BeanUtils;
import org.springframework.mail.MailAuthenticationException;
import org.springframework.mail.MailSendException;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.EmailValidator;
import com.opensymphony.xwork2.validator.annotations.IntRangeFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 后台Action类 - 系统配置
 */

@ParentPackage("admin")
public class SettingAction extends BaseAdminAction {

	private static final long serialVersionUID = -6200425957233641240L;

	private Setting setting;
	private String smtpToMail;
	private File cardLogo;
	private File defaultBigCardsImage;
	private File defaultSmallCardsImage;
	private File defaultThumbnailCardsImage;
	private File watermarkImage;
	
	@Resource(name = "mailServiceImpl")
	private MailService mailService;
	@Resource(name = "jobServiceImpl")
	private JobService jobService;
	@Resource(name = "cacheServiceImpl")
	private CacheService cacheService;
	
	// 发送SMTP测试邮件
	@Validations(
		requiredStrings = { 
			@RequiredStringValidator(fieldName = "setting.smtpFromMail", message = "发件人邮箱不允许为空!"),
			@RequiredStringValidator(fieldName = "setting.smtpHost", message = "SMTP服务器地址不允许为空!"),
			@RequiredStringValidator(fieldName = "setting.smtpUsername", message = "SMTP用户名不允许为空!"),
			@RequiredStringValidator(fieldName = "setting.smtpPassword", message = "SMTP密码不允许为空!"),
			@RequiredStringValidator(fieldName = "smtpToMail", message = "收件人邮箱不允许为空!")
		},
		requiredFields = {
			@RequiredFieldValidator(fieldName = "setting.smtpPort", message = "SMTP服务器端口不允许为空!")
		},
		intRangeFields = {
			@IntRangeFieldValidator(fieldName = "setting.smtpPort", min = "0", message = "SMTP端口必须为零正整数!")
		},
		emails = {
			@EmailValidator(fieldName = "setting.smtpFromMail", message = "发件人邮箱格式错误!"),
			@EmailValidator(fieldName = "smtpToMail", message = "收件人邮箱格式错误!")
		}
	)
	
	@InputConfig(resultName = "ajaxError")
	public String ajaxSendSmtpTest() {
		try {
			mailService.sendSmtpTestMail(setting.getSmtpFromMail(), setting.getSmtpHost(), setting.getSmtpPort(), setting.getSmtpUsername(), setting.getSmtpPassword(), smtpToMail);
		} catch (MailAuthenticationException e) {
			return ajax(Status.error, "权限验证失败,请检查SMTP用户名、密码!");
		} catch (MailSendException e) {
			return ajax(Status.error, "邮件发送失败,请检查发件人邮箱、SMTP服务器地址、端口!");
		} catch (Exception e) {
			return ajax(Status.error, "邮件发送失败!");
		}
		return ajax(Status.success, "测试邮件发送成功,请查收邮件!");
	}

	// 编辑
	public String edit() {
		setting = SettingUtil.getSetting();
		return INPUT;
	}

	// 更新
	@Validations(
		requiredStrings = { 
			@RequiredStringValidator(fieldName = "setting.smtpFromMail", message = "发件人邮箱不允许为空!"),
			@RequiredStringValidator(fieldName = "setting.smtpHost", message = "SMTP服务器地址不允许为空!"),
			@RequiredStringValidator(fieldName = "setting.smtpUsername", message = "SMTP用户名不允许为空!")
		}, 
		requiredFields = {
			@RequiredFieldValidator(fieldName = "setting.isRegisterEnabled", message = "是否开放注册不允许为空!"),
			@RequiredFieldValidator(fieldName = "setting.isLoginFailureLock", message = "是否开启自动锁定账号功能不允许为空!"),
			@RequiredFieldValidator(fieldName = "setting.loginFailureLockCount", message = "连续登录失败最大次数不允许为空!"),
			@RequiredFieldValidator(fieldName = "setting.loginFailureLockTime", message = "自动解锁时间不允许为空!"),
			@RequiredFieldValidator(fieldName = "setting.smtpPort", message = "SMTP服务器端口不允许为空!"),
			@RequiredFieldValidator(fieldName = "setting.isGzipEnabled", message = "是否开启GZIP功能不允许为空!"),
			@RequiredFieldValidator(fieldName = "setting.buildHtmlDelayTime", message = "HTML自动生成延时不允许为空!")
		},
		intRangeFields = {
			@IntRangeFieldValidator(fieldName = "setting.loginFailureLockCount", min = "1", message = "连续登录失败最大次数必须为正整数!"),
			@IntRangeFieldValidator(fieldName = "setting.loginFailureLockTime", min = "0", message = "自动解锁时间必须为零或正整数!"),
			@IntRangeFieldValidator(fieldName = "setting.smtpPort", min = "0", message = "SMTP端口必须为零或正整数!"),
			@IntRangeFieldValidator(fieldName = "setting.buildHtmlDelayTime", min = "0", message = "HTML自动生成延时必须为零或正整数!")
		},
		emails = {
			@EmailValidator(fieldName = "setting.email", message = "E-mail格式错误!"),
			@EmailValidator(fieldName = "setting.smtpFromMail", message = "发件人邮箱格式错误!")
		}
	)
	@InputConfig(resultName = "error")
	public String update() throws Exception {
		Setting persistent = SettingUtil.getSetting();
		
		if (StringUtils.isNotEmpty(setting.getSmtpPassword())) {
			persistent.setSmtpPassword(setting.getSmtpPassword());
		}
		if (!setting.getIsLoginFailureLock()) {
			persistent.setLoginFailureLockCount(3);
			persistent.setLoginFailureLockTime(10);
		}
		if (cardLogo != null) {
			File destCardLogo = new File(getRealPath(persistent.getCardLogoPath()));
			ImageUtil.toJpegImageFile(cardLogo, destCardLogo);
		}
		BeanUtils.copyProperties(setting, persistent, new String[] {"cardName","cardUrl","currencyType","currencySign","currencyUnit","priceScale","priceRoundType","scoreType","scoreScale","isInstantMessagingEnabled","isLeaveMessageEnabled","isLeaveMessageCaptchaEnabled","leaveMessageDisplayType","cardLogoPath","systemName", "systemVersion", "systemDescription", "contextPath", "imageUploadPath", "imageBrowsePath", "adminLoginUrl", "adminLoginProcessingUrl", "isShowPoweredInfo","withdrawEveryDayCount","withdrawEveryDayMoney","withdrawEveryMaxMoney","withdrawEveryMinMoney","withdrawMaxMoney","withdrawMaxCount", "cardLogoPath", "defaultBigCardsImagePath", "defaultSmallCardsImagePath", "defaultThumbnailCardsImagePath", "watermarkImagePath", "isInstantMessagingEnabled", "instantMessagingPosition", "instantMessagingTitle", "isLeaveMessageEnabled", "isLeaveMessageCaptchaEnabled", "leaveMessageDisplayType", "isCommentEnabled", "isCommentCaptchaEnabled", "commentAuthority", "commentDisplayType"});
		SettingUtil.updateSetting(persistent);
		
		cacheService.flushAllPageCache(getRequest());
		jobService.buildIndexHtml();
		jobService.buildLoginHtml();
		jobService.buildRegisterAgreementHtml();
		jobService.buildAdminJs();
		jobService.buildCardJs();
		jobService.buildArticleContentHtml();
		jobService.buildCardsContentHtml();
		
		redirectUrl = "setting!edit.action";
		return SUCCESS;
	}
	
	// 获取货币种类集合
	public List<CurrencyType> getCurrencyTypeList() {
		return Arrays.asList(CurrencyType.values());
	}
	
	// 获取小数位精确方式集合
	public List<RoundType> getRoundTypeList() {
		return Arrays.asList(RoundType.values());
	}
	
	// 获取水印位置集合
	public List<WatermarkPosition> getWatermarkPositionList() {
		return Arrays.asList(WatermarkPosition.values());
	}
	
	// 获取积分获取方式集合
	public List<ScoreType> getScoreTypeList() {
		return Arrays.asList(ScoreType.values());
	}
	
	// 获取运算符集合
	public List<Operator> getOperatorList() {
		return Arrays.asList(Operator.values());
	}

	public Setting getSetting() {
		return setting;
	}

	public void setSetting(Setting setting) {
		this.setting = setting;
	}

	public String getSmtpToMail() {
		return smtpToMail;
	}

	public void setSmtpToMail(String smtpToMail) {
		this.smtpToMail = smtpToMail;
	}

	public File getCardLogo() {
		return cardLogo;
	}

	public void setCardLogo(File cardLogo) {
		this.cardLogo = cardLogo;
	}

	public File getDefaultBigCardsImage() {
		return defaultBigCardsImage;
	}

	public void setDefaultBigCardsImage(File defaultBigCardsImage) {
		this.defaultBigCardsImage = defaultBigCardsImage;
	}

	public File getDefaultSmallCardsImage() {
		return defaultSmallCardsImage;
	}

	public void setDefaultSmallCardsImage(File defaultSmallCardsImage) {
		this.defaultSmallCardsImage = defaultSmallCardsImage;
	}

	public File getDefaultThumbnailCardsImage() {
		return defaultThumbnailCardsImage;
	}

	public void setDefaultThumbnailCardsImage(File defaultThumbnailCardsImage) {
		this.defaultThumbnailCardsImage = defaultThumbnailCardsImage;
	}

	public File getWatermarkImage() {
		return watermarkImage;
	}

	public void setWatermarkImage(File watermarkImage) {
		this.watermarkImage = watermarkImage;
	}

	public MailService getMailService() {
		return mailService;
	}

	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
	
	// 获取随机数
	public int getRandom() {
		return (int) (Math.random() * 100000);
	}

}