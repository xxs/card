package net.xxs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import net.xxs.bean.SpecificationValue;
import net.xxs.dao.GoodsDao;
import net.xxs.dao.ProductDao;
import net.xxs.entity.Goods;
import net.xxs.entity.Product;
import net.xxs.service.ProductService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service实现类 - 货品
 */

@Service("productServiceImpl")
public class ProductServiceImpl extends BaseServiceImpl<Product, String> implements ProductService {
	
	@Resource(name = "productDaoImpl")
	private ProductDao productDao;
	@Resource(name = "goodsDaoImpl")
	private GoodsDao goodsDao;

	@Resource(name = "productDaoImpl")
	public void setBaseDao(ProductDao productDao) {
		super.setBaseDao(productDao);
	}
	
	@Transactional(readOnly = true)
	public boolean isExistByProductSn(String productSn) {
		return productDao.isExistByProductSn(productSn);
	}
	
	@Transactional(readOnly = true)
	public boolean isUniqueByProductSn(String oldProductSn, String newProductSn) {
		if (StringUtils.equalsIgnoreCase(oldProductSn, newProductSn)) {
			return true;
		} else {
			if (productDao.isExistByProductSn(newProductSn)) {
				return false;
			} else {
				return true;
			}
		}
	}
	
	@Transactional(readOnly = true)
	public Long getStoreAlertCount() {
		return productDao.getStoreAlertCount();
	}
	
	// 处理货品名称、货品默认、商品销售价、商品市场价、商品重量、商品库存、商品被占用库存数
	@Override
	public String save(Product product) {
		Goods goods = product.getGoods();
		if (goods.getIsSpecificationEnabled()) {
			StringBuffer productName = new StringBuffer(goods.getName());
			List<SpecificationValue> specificationValueList = product.getSpecificationValueList();
			if (specificationValueList != null) {
				productName.append(" [");
				for (SpecificationValue specificationValue : specificationValueList) {
					productName.append(specificationValue.getName() + " ");
				}
				productName.deleteCharAt(productName.length() - 1);
				productName.append("]");
			}
			product.setName(productName.toString());
			product.setFreezeStore(0);
		} else {
			product.setName(goods.getName());
			product.setIsDefault(true);
			product.setIsMarketable(goods.getIsMarketable());
			product.setFreezeStore(0);
		}
		String id = productDao.save(product);
		
		if (goods.getIsSpecificationEnabled()) {
			if (product.getIsDefault()) {
				goods.setPrice(product.getPrice());
				goods.setCost(product.getCost());
				goods.setMarketPrice(product.getMarketPrice());
				goods.setWeight(product.getWeight());
			}
			
			Integer goodsStore = 0;
			Integer goodsFreezeStore = 0;
			Boolean hasProductMarketable = false;
			List<Product> productList = productDao.getSiblingsProductList(id);
			for (Product p : productList) {
				if (goodsStore != null) {
					if (p.getStore() != null) {
						goodsStore += p.getStore();
					} else {
						goodsStore = null;
					}
				}
				goodsFreezeStore += p.getFreezeStore();
				if (p.getIsMarketable()) {
					hasProductMarketable = true;
				}
			}
			goods.setStore(goodsStore);
			goods.setFreezeStore(goodsFreezeStore);
			if (!hasProductMarketable) {
				goods.setIsMarketable(false);
			}
		} else {
			goods.setPrice(product.getPrice());
			goods.setCost(product.getCost());
			goods.setMarketPrice(product.getMarketPrice());
			goods.setWeight(product.getWeight());
			goods.setStore(product.getStore());
			goods.setFreezeStore(product.getFreezeStore());
		}
		goodsDao.update(goods);
		
		return id;
	}
	
	// 处理货品名称、货品默认、商品销售价、商品市场价、商品重量、商品库存、商品被占用库存数
	@Override
	public void update(Product product) {
		Goods goods = product.getGoods();
		if (goods.getIsSpecificationEnabled()) {
			StringBuffer productName = new StringBuffer(goods.getName());
			List<SpecificationValue> specificationValueList = product.getSpecificationValueList();
			if (specificationValueList != null) {
				productName.append(" [");
				for (SpecificationValue specificationValue : specificationValueList) {
					productName.append(specificationValue.getName() + " ");
				}
				productName.deleteCharAt(productName.length() - 1);
				productName.append("]");
			}
			product.setName(productName.toString());
			if (product.getStore() == null) {
				product.setFreezeStore(0);
			}
		} else {
			product.setName(goods.getName());
			product.setIsDefault(true);
			product.setIsMarketable(goods.getIsMarketable());
			if (product.getStore() == null) {
				product.setFreezeStore(0);
			}
		}
		productDao.update(product);
		
		if (goods.getIsSpecificationEnabled()) {
			if (product.getIsDefault()) {
				goods.setPrice(product.getPrice());
				goods.setCost(product.getCost());
				goods.setMarketPrice(product.getMarketPrice());
				goods.setWeight(product.getWeight());
			}
			
			Integer goodsStore = 0;
			Integer goodsFreezeStore = 0;
			Boolean hasProductMarketable = false;
			List<Product> productList = productDao.getSiblingsProductList(product.getId());
			for (Product p : productList) {
				if (goodsStore != null) {
					if (p.getStore() != null) {
						goodsStore += p.getStore();
					} else {
						goodsStore = null;
					}
				}
				goodsFreezeStore += p.getFreezeStore();
				if (p.getIsMarketable()) {
					hasProductMarketable = true;
				}
			}
			goods.setStore(goodsStore);
			goods.setFreezeStore(goodsFreezeStore);
			if (!hasProductMarketable) {
				goods.setIsMarketable(false);
			}
		} else {
			goods.setPrice(product.getPrice());
			goods.setCost(product.getCost());
			goods.setMarketPrice(product.getMarketPrice());
			goods.setWeight(product.getWeight());
			goods.setStore(product.getStore());
			goods.setFreezeStore(product.getFreezeStore());
		}
		goodsDao.update(goods);
	}

}