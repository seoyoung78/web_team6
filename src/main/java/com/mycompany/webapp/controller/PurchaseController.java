package com.mycompany.webapp.controller;

import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.webapp.dto.OrderProducts;
import com.mycompany.webapp.dto.Orders;
import com.mycompany.webapp.dto.Reviews;
import com.mycompany.webapp.service.OrderProductsService;
import com.mycompany.webapp.service.OrdersService;
import com.mycompany.webapp.service.ProductsRefundService;
import com.mycompany.webapp.service.ReviewsService;

@Controller
@RequestMapping("/user")
public class PurchaseController {
	private static final Logger logger =
			LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	DataSource dateSource;
	
	@Autowired
	ProductsRefundService productsRefundService;
	
	@Autowired
	OrdersService ordersService;
	
	@Autowired
	private ReviewsService reviewsService;
	
	@Autowired
	OrderProductsService orderProductsService;
	
	
	/*주문리스트*/
	@GetMapping("/purchaselist")
	public String openPurchaseList(Model model,Authentication auth) {
		String userId = auth.getName();
		
		List<Orders> list = ordersService.getOrders(userId);
		model.addAttribute("list",list);
		
		logger.info("주문리스트 실행");
		
		return "purchase/purchaseList";
	}	
	
	/*주문디테일*/
	@GetMapping("/purchaseListDetail")
	public String openPurchaseListDetail(Model model, int orderNo, Authentication auth) {
		String userId = auth.getName();
		
		List<OrderProducts> list = orderProductsService.getOrderDetail(orderNo, userId);
		model.addAttribute("list",list);
		
		logger.info("상세보기 실행");
		return "purchase/purchaseListDetail";
	}
	
	/*환불*/
	@PostMapping("/exchangerefund")
	public String ExchangeRefund(int orderNo, Model model) {
		logger.info(String.valueOf(orderNo));
		model.addAttribute("orderNo", orderNo);
		
		productsRefundService.saveRefund(orderNo);
		return "purchase/exchangeRefund";
	}
		
	@PostMapping("/refundcomplete")
	public String refundComplete(int orderNo, String reason) {
		logger.info(String.valueOf(orderNo));
		
		int ono = orderNo;
		String refundReason = "";
		
		if(reason.equals("one")) {
			refundReason = "고객 변심";
		} else if(reason.equals("two")) {
			refundReason = "상품 불량";
		} else if(reason.equals("three")) {
			refundReason = "서비스 불만족";
		} else if(reason.equals("four")) {
			refundReason = "늦은 배송";
		} else if(reason.equals("five")) {
			refundReason = "기타";
		}		
		
		logger.info(refundReason);
		productsRefundService.updateRefund(ono, refundReason);
		return "redirect:/user/purchaselist";
	}
	
	/*리뷰*/
	@PostMapping("/review")
	public String openReview(int orderNo, int productNo, Model model) {
		model.addAttribute("orderNo", orderNo);
		model.addAttribute("productNo", productNo);
		return "purchase/review";
	}
	
	@PostMapping("/createreview")
	public String updateReview(Authentication auth, int orderNo, int productNo, String reviewContent) {
		String userId = auth.getName();
		logger.info(String.valueOf(orderNo));
		logger.info(String.valueOf(productNo));
		logger.info(reviewContent);
		reviewsService.saveReview(userId, orderNo, productNo, reviewContent);
		orderProductsService.updateReview(orderNo, productNo, userId);
		return "redirect:/user/purchaseListDetail";
	}
	
	@GetMapping("/delreview")
	public String delReview(Authentication auth, int reviewNo) {
		String userId = auth.getName();
		reviewsService.deleteReview(reviewNo, userId);		
		return "redirect:/product";
	}

}

