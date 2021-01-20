package com.watchn.orders.web;

import com.watchn.orders.services.OrderService;
import com.watchn.orders.web.payload.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/orders")
@Api(tags = {"orders"})
@Slf4j
public class OrderController {

    @Autowired
    private OrderService service;

    @Autowired
    private OrderMapper orderMapper;

    @PostMapping
    @ApiOperation(value = "Create an order", nickname = "createOrder")
    public ExistingOrder order(@RequestBody Order orderRequest) {
        log.error("{}", orderRequest);
        return this.orderMapper.toExistingOrder(this.service.create(this.orderMapper.toOrderEntity(orderRequest)));
    }

    @GetMapping
    @ApiOperation(value = "List orders", nickname = "listOrders")
    public List<ExistingOrder> order() {
        return this.service.list().stream().map(this.orderMapper::toExistingOrder).collect(Collectors.toList());
    }
}
