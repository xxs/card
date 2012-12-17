package net.xxs.dao.impl;

import java.util.List;

import net.xxs.dao.DeliveryTemplateDao;
import net.xxs.entity.DeliveryTemplate;

import org.springframework.stereotype.Repository;

/**
 * Dao实现类 - 快递单模板
 */

@Repository("deliveryTemplateDaoImpl")
public class DeliveryTemplateDaoImpl extends BaseDaoImpl<DeliveryTemplate, String> implements DeliveryTemplateDao {
	
	public DeliveryTemplate getDefaultDeliveryTemplate() {
		String hql = "from DeliveryTemplate as deliveryTemplate where deliveryTemplate.isDefault = :isDefault";
		DeliveryTemplate defaultDeliveryTemplate = (DeliveryTemplate) getSession().createQuery(hql).setParameter("isDefault", true).uniqueResult();
		if(defaultDeliveryTemplate == null) {
			hql = "from DeliveryTemplate as deliveryTemplate order by deliveryTemplate.createDate asc";
			defaultDeliveryTemplate = (DeliveryTemplate) getSession().createQuery(hql).setMaxResults(1).uniqueResult();
		}
		return defaultDeliveryTemplate;
	}
	
	// 保存时若对象isDefault=true,则设置其它对象isDefault值为false
	@Override
	@SuppressWarnings("unchecked")
	public String save(DeliveryTemplate deliveryTemplate) {
		if (deliveryTemplate.getIsDefault()) {
			String hql = "from DeliveryTemplate as deliveryTemplate where deliveryTemplate.isDefault = :isDefault";
			List<DeliveryTemplate> deliveryTemplateList = getSession().createQuery(hql).setParameter("isDefault", true).list();
			if (deliveryTemplateList != null) {
				for (DeliveryTemplate d : deliveryTemplateList) {
					d.setIsDefault(false);
				}
			}
		}
		return super.save(deliveryTemplate);
	}

	// 更新时若对象isDefault=true,则设置其它对象isDefault值为false
	@Override
	@SuppressWarnings("unchecked")
	public void update(DeliveryTemplate deliveryTemplate) {
		if (deliveryTemplate.getIsDefault()) {
			String hql = "from DeliveryTemplate as deliveryTemplate where deliveryTemplate.isDefault = :isDefault and deliveryTemplate != :deliveryTemplate";
			List<DeliveryTemplate> deliveryTemplateList = getSession().createQuery(hql).setParameter("isDefault", true).setParameter("deliveryTemplate", deliveryTemplate).list();
			if (deliveryTemplateList != null) {
				for (DeliveryTemplate d : deliveryTemplateList) {
					d.setIsDefault(false);
				}
			}
		}
		super.update(deliveryTemplate);
	}
	
}