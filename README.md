# customer_management_sql

Customer Relationship Management (CRM) SQL Project


# Project Overview

This project is a Customer Relationship Management (CRM) database built using MySQL.
It helps manage customer information, track interactions, manage leads, orders, and support tickets — providing a strong foundation for sales and customer analytics.
The project demonstrates how SQL can be used to model and query real-world business data effectively.

# Database Structure

Tables Used

  Table                       	            Description
Customers	           Stores details of customers such as name, contact, and company.
Interactions	       Tracks communications between sales representatives and customers (calls, emails, meetings).
Leads                Records potential business opportunities and their status.
Products      	     Stores product/service details offered by the company.
Orders        	     Tracks customer purchases and sales revenue.
SupportTickets	     Logs customer support issues and resolutions.

# ER Diagram 

Customers ──< Interactions  
Customers ──< Leads  
Customers ──< Orders >── Products  
Customers ──< SupportTickets
