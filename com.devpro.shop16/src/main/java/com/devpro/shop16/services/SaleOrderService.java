package com.devpro.shop16.services;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.shop16.dto.ShippingModel;
import com.devpro.shop16.dto.SubcribeSearchModel;
import com.devpro.shop16.entities.Categories;
import com.devpro.shop16.entities.SaleOrder;
import com.devpro.shop16.entities.SaleOrderProducts;
import com.devpro.shop16.entities.Subcribe;
import com.devpro.shop16.entities.Users;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}
	
	@Autowired private SaleOrderProductService saleOrderProductService;
	@ModelAttribute("saleOrderProduct")
	public  List<SaleOrderProducts> getSaleOrderProduct() {
		return saleOrderProductService.findAll();
	}
	
	
	public  SaleOrder getShipDetail(String shipCode) {
		String sql = "SELECT * FROM tbl_saleorder p WHERE code = "+shipCode;
		return getOneByNativeSQL(sql);
	}
	
	public PagerData<SaleOrder> search_shipping(ShippingModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder p WHERE shipped = false order by created_date desc";

		if (searchModel != null) {
		
		
			
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.code like '%" + searchModel.keyword + "%'" + " or p.created_date like '%" 
						+ searchModel.keyword + "%'" + " or p.user_id like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}
	
	
	public PagerData<SaleOrder> search_shipped(ShippingModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder p WHERE shipped = true order by created_date desc";

		if (searchModel != null) {
		
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.code like '%" + searchModel.keyword + "%'" + " or p.created_date like '%" 
						+ searchModel.keyword + "%'" + " or p.user_id like '%" + searchModel.keyword + "%')";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}
	
	
	@Transactional
	public SaleOrder update(SaleOrder p)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		SaleOrder soInDb = super.getById(p.getId());
		
		
		soInDb.setShipped(true);

		
		// lưu vào database
		return super.saveOrUpdate(soInDb);
	}
}
