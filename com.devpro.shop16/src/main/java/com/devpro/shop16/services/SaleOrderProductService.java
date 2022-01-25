package com.devpro.shop16.services;

import org.springframework.stereotype.Service;

import com.devpro.shop16.entities.SaleOrderProducts;
@Service
public class SaleOrderProductService extends BaseService<SaleOrderProducts> {

	@Override
	protected Class<SaleOrderProducts> clazz() {
		return SaleOrderProducts.class;
	}

}
