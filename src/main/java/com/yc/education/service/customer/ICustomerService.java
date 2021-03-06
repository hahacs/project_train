package com.yc.education.service.customer;

import com.yc.education.model.customer.Customer;
import com.yc.education.service.IService;

import java.util.List;

/**
 * @Author: BlueSky
 * @Date: 2018/8/20 11:23
 */
public interface ICustomerService extends IService<Customer>{

    /**
     * 查询现有客户（小窗口）
     * @return
     */
    List<Customer> listExistCustomer(int page, int rows);

    /**
     * @Author BlueSky
     * @Description //TODO 查询所有客户
     * @Date 11:24 2018/8/20
     * @Param [page, rows]
     * @return java.util.List<com.yc.education.model.customer.Customer>
     **/
    List<Customer> listCustomerAll(int page, int rows);

    /**
     * @Author BlueSky
     * @Description //TODO 查询客户
     * @Date 11:41 2018/8/20
     * @Param [code]
     * @return com.yc.education.model.customer.Customer
     **/
    Customer getCustomer(String code);

    /**
     * 最后一条数据
     * @return
     */
    Customer getLastCustomer();

    /**
     * 第一条数据
     * @return
     */
    Customer getFirstCustomer();

    /**
     * 获取上下页客户数据
     * @param page
     * @param rows
     * @return
     */
    Customer getCustomerByPage(int page, int rows);

    /**
     * 统计客户数量
     * @return
     */
    int getCustomerCount();
}
