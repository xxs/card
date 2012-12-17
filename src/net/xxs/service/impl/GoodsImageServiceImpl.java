package net.xxs.service.impl;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import net.xxs.bean.GoodsImage;
import net.xxs.bean.Setting;
import net.xxs.service.GoodsImageService;
import net.xxs.util.CommonUtil;
import net.xxs.util.ImageUtil;
import net.xxs.util.SettingUtil;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ServletContextAware;

/**
 * Service实现类 - 商品图片
 */

@Service("goodsImageServiceImpl")
public class GoodsImageServiceImpl implements GoodsImageService, ServletContextAware {
	
	private ServletContext servletContext;
	
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	public GoodsImage buildGoodsImage(File goodsImageFile) {
		Setting setting = SettingUtil.getSetting();
		String uuid = CommonUtil.getUUID();
		
		GoodsImage goodsImage = new GoodsImage();
		goodsImage.setId(uuid);
		goodsImage.setPath(setting.getImageUploadRealPath());
		goodsImage.setSourceImageFormatName(ImageUtil.getFormatName(goodsImageFile));
		
		File sourceGoodsImageFile = new File(servletContext.getRealPath(goodsImage.getSourceImagePath()));
		File bigGoodsImageFile = new File(servletContext.getRealPath(goodsImage.getBigImagePath()));
		File smallGoodsImageFile = new File(servletContext.getRealPath(goodsImage.getSmallImagePath()));
		File thumbnailGoodsImageFile = new File(servletContext.getRealPath(goodsImage.getThumbnailImagePath()));
		File watermarkImageFile = new File(servletContext.getRealPath(setting.getWatermarkImagePath()));

		File sourceGoodsImageParentFile = sourceGoodsImageFile.getParentFile();
		File bigGoodsImageParentFile = bigGoodsImageFile.getParentFile();
		File smallGoodsImageParentFile = smallGoodsImageFile.getParentFile();
		File thumbnailGoodsImageParentFile = thumbnailGoodsImageFile.getParentFile();

		if (!sourceGoodsImageParentFile.isDirectory()) {
			sourceGoodsImageParentFile.mkdirs();
		}
		if (!bigGoodsImageParentFile.isDirectory()) {
			bigGoodsImageParentFile.mkdirs();
		}
		if (!smallGoodsImageParentFile.isDirectory()) {
			smallGoodsImageParentFile.mkdirs();
		}
		if (!thumbnailGoodsImageParentFile.isDirectory()) {
			thumbnailGoodsImageParentFile.mkdirs();
		}
		
		try {
			FileUtils.copyFile(goodsImageFile, sourceGoodsImageFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		ImageUtil.reduceAndImageWatermark(goodsImageFile, bigGoodsImageFile, setting.getBigGoodsImageWidth(), setting.getBigGoodsImageHeight(), watermarkImageFile, setting.getWatermarkPosition(), setting.getWatermarkAlpha());
		ImageUtil.reduceAndImageWatermark(goodsImageFile, smallGoodsImageFile, setting.getSmallGoodsImageWidth(), setting.getSmallGoodsImageHeight(), watermarkImageFile, setting.getWatermarkPosition(), setting.getWatermarkAlpha());
		ImageUtil.reduce(goodsImageFile, thumbnailGoodsImageFile, setting.getThumbnailGoodsImageHeight(), setting.getThumbnailGoodsImageWidth());
		
		return goodsImage;
	}

}