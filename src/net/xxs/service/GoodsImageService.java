package net.xxs.service;

import java.io.File;

import net.xxs.bean.GoodsImage;


/**
 * Service接口 - 商品图片
 */

public interface GoodsImageService {
	
	/**
	 * 生成商品图片（大图、小图、缩略图）
	 * 
	 * @param goodsImageFile
	 *            图片文件
	 * 
	 */
	public GoodsImage buildGoodsImage(File goodsImageFile);

}