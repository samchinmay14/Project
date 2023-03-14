package com.example.demo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.Order;
import com.example.demo.entities.Order_item;
import com.example.demo.services.OrderService;
import com.example.demo.services.Order_itemService;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class Order_itemController 
{
	@Autowired
	Order_itemService ois;
	
	@Autowired
	OrderService os;
	
	@GetMapping("/getAllOrder_items")
	public List<Order_item> getAllOrder_items()
	{
		return ois.getAllOrder_items();
	}
	
	@GetMapping("/getorderbyspid")
	public List<Order_item> getOrderBySpid(@RequestParam("sp_id") int id)
	{
		Order o=os.getOrderBySpid(id);
		return ois.getorderitembyoid(o.getO_id());
	}
	
	@GetMapping("/ordercompleted")
	public void OrderCompleted(@RequestParam("oi_id") int id)
	{
		ois.OrderCompleted(id);
	}
}
