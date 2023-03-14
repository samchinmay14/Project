package com.example.demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import com.example.demo.entities.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> 
{
	@Query("select o from Order o where o.sp_id.sp_id=:sp_id ")
	Order getOrderBySpid(int sp_id);
}
