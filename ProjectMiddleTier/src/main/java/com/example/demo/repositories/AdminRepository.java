package com.example.demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Integer> {
	

}
