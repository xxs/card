package net.xxs.payment.util;

public class ServerConnSzxUtils {

    /**
     * 对卡信息进行des加密，并进行base64编码
     *
     * @param cardMoney 卡金额
     * @param cardSn    卡序列号
     * @param cardPwd   卡密码
     * @param desKey    des密码
     * @return 进行des加密，并进行base64的字符串
     */
    public static String getDesEncryptBase64String(String cardMoney, String cardSn, String cardPwd, String desKey) {
        System.out.println("DES String:" + cardMoney + "@" + cardSn + "@" + cardPwd);
        //String desString = DesEncrypt.getEncString(cardMoney + "@" + cardSn + "@" + cardPwd, desKey, "UTF8");
        String desString;
        try {
            desString = DES.encode(cardMoney + "@" + cardSn + "@" + cardPwd, desKey);
        } catch (Exception e) {
            e.printStackTrace();
            desString = "";
        }
        return desString;
    }

}
