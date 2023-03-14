package com.example.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Order_item;
import com.example.demo.repositories.Order_itemRepository;

@Service
public class Order_itemService 
{
	@Autowired 
	Order_itemRepository oir;

	public List<Order_item> getAllOrder_items() 
	{
		return oir.findAll();
	}

	public List<Order_item> getOrdersbySP(int id)
	{
		return oir.getOrdersbySP(id);
	}

	public List<Order_item> getorderitembyoid(int o_id) 
	{
		return oir.getOrderitembyoid(o_id);
	}

	public void OrderCompleted(int id) 
	{
		oir.OrderCompleted(id);
	}
	public Order_item insertOrderItems(Order_item o_item)
	{
		return oir.save(o_item);
	}
}
