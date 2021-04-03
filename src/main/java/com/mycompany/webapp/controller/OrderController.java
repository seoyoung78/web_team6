package com.mycompany.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Cart;
import com.mycompany.webapp.dto.OrderProducts;
import com.mycompany.webapp.dto.Orders;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Products;
import com.mycompany.webapp.dto.Wishlist;
import com.mycompany.webapp.service.CartService;
import com.mycompany.webapp.service.OrderProductsService;
import com.mycompany.webapp.service.OrdersService;
import com.mycompany.webapp.service.ProductsService;
import com.mycompany.webapp.service.WishlistService;


@Controller
@RequestMapping("/user")
public class OrderController {
	private static final Logger logger =
			LoggerFactory.getLogger(OrderController.class);

	Cart[] cartArray;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductsService productService;
	
	@Autowired
	private WishlistService wishlistService;


	@Autowired
	private OrdersService ordersService;

	@Autowired
	private OrderProductsService orderProductsService;
	
	@GetMapping("/cart")
	public String openCart(Authentication auth, Model model) {
		String userId = auth.getName();
		List<Cart> clist = cartService.getCart(userId);
		logger.info(String.valueOf(clist.size()));
		model.addAttribute("clist",clist);
		model.addAttribute("size", clist.size());
		cartArray = new Cart[clist.size()];
		return "order/cart";
	}
	
	/*	@GetMapping("/cart")
		public String openCart(Authentication auth, String pageNo, Model model, HttpSession session) {
			String userId = auth.getName();
			
			int intPageNo = 1;
			if(pageNo == null ) {
				Pager pager = (Pager)session.getAttribute("pager");
				if (pager != null) {
					intPageNo = pager.getPageNo();
				}
			} else {
				intPageNo = Integer.parseInt(pageNo);
			}
					
			int totalRows = cartService.getTotalRows(userId);
			Pager pager = new Pager(5, 5, totalRows, intPageNo);
			session.setAttribute("pager", pager);		
			
			List<Cart> clist = cartService.getCart(pager, userId);
			cartArray = new Cart[clist.size()];
			
			//logger.info(String.valueOf(clist.size()));
			//logger.info(clist.getIndex(1).getIndex);
			model.addAttribute("clist",clist);
			model.addAttribute("pager", pager);	
			
			return "order/cart";
		}*/
	
	//선택옵션 정보
	@PostMapping("/addcart")
	public String addCart(Authentication auth, Cart cart) {

		boolean check = true;
		cart.setUserId(auth.getName());

		Products product = productService.getProductDetail(cart.getProductNo()).get(0);
		int allprice = cart.getAmount()*product.getProductPrice();
		cart.setAllPrice(allprice);
		
		List<Cart> list = cartService.getCart(auth.getName());

		for(int i=0; i<list.size(); i++) { 
			if(list.get(i).getProductNo() == cart.getProductNo() 
					&& list.get(i).getUserId().equals(cart.getUserId())) {
				check = false; 
				break; 
			} 
		}
		
		if(check == true) {
			int result = cartService.saveCart(cart);
		}else {
			logger.info("false다");
		}

		return "redirect:/product?productNo=" + cart.getProductNo();
	}

	@GetMapping("/delcart")
	public String delCart(Authentication auth, int productNo) {
		logger.info("실행");
		int pno = productNo;
		String userID = auth.getName();
		
		/*Cart cart = new Cart();
		cart.setUserId("a1@gmail.com");
		cart.setProductNo(productNo);
		cart.setAmount(2);
		cart.setAllprice(20000);
		cart.setRegdate(new Date());
		cart.setProductName("샘플1");
		cart.setPrice(10000);
		cart.setImgOname("26.jpg");
		cart.setImgSname("132546-1231");
		cart.setImgType("image");*/
		
		logger.info(String.valueOf(productNo));
		
		cartService.deleteCart(pno, userID);
		
		return "redirect:/user/cart";
	}
	
	@PostMapping("/updateamount")
	public String updateAmount(Cart cart) {
		//Products product = productsService.getProduct(cart.getProductNo());
		int allprice = cart.getAmount() * cart.getPrice();
		cart.setAllPrice(allprice);
		cartService.updateAmount(cart);
		return "redirect:/user/cart";
	}

	@PostMapping("/order")
	public String openOrder(HttpServletRequest request, Authentication auth, Cart cart, Model model) {
		String userId = auth.getName();
		
		String[] productNo = request.getParameterValues("productNo");
		String[] amount = request.getParameterValues("amount");
		String[] allPrice = request.getParameterValues("allPrice");
		String[] productName = request.getParameterValues("productName");
		String[] price = request.getParameterValues("price");
		String[] imgOname = request.getParameterValues("imgOname");
		String[] imgSname = request.getParameterValues("imgSname");
		String[] imgType = request.getParameterValues("imgType");
		
		for(int i =0; i < cartArray.length; i++) {
			cartArray[i] = new Cart();
//			logger.info(productName[i]);
//			logger.info(String.valueOf(productNo[i]));
			if(cartArray[i].getProductName() == null) {
				cartArray[i].setProductNo(Integer.parseInt(productNo[i]));
				cartArray[i].setUserId(userId);
				cartArray[i].setAmount(Integer.parseInt(amount[i]));
				cartArray[i].setAllPrice(Integer.parseInt(allPrice[i]));
				cartArray[i].setProductName(productName[i]);
				cartArray[i].setPrice(Integer.parseInt(price[i]));
				cartArray[i].setImgOname(imgOname[i]);
				cartArray[i].setImgSname(imgSname[i]);
				cartArray[i].setImgType(imgType[i]);							
			}
//			logger.info(String.valueOf(cartArray[i].getProductNo()));
//			logger.info(cartArray[i].getUserId());
//			logger.info(String.valueOf(cartArray[i].getAmount()));
//			logger.info(String.valueOf(cartArray[i].getAllPrice()));
//			logger.info(cartArray[i].getProductName());
//			logger.info(cartArray[i].getImgOname());
//			logger.info(cartArray[i].getImgSname());
//			logger.info(cartArray[i].getImgType());			
		}
		
		String sum = request.getParameter("sum");
		String count = request.getParameter("count");
//		logger.info(sum);
//		logger.info(count);
		model.addAttribute("sum", Integer.parseInt(sum));
		model.addAttribute("count", Integer.parseInt(count));
		
		return "order/order";
	}

	@PostMapping("/ordercomplete")
	public String openOrdercomplete(Authentication auth, HttpServletRequest request) {
		Orders orders = new Orders();
		String allPrice = request.getParameter("allPrice");
		String zipCode = request.getParameter("zipCode");
		String userId = auth.getName();
		
		orders.setUserId(userId);	
		orders.setAllPrice(Integer.parseInt(allPrice));
		orders.setZipCode(Integer.parseInt(zipCode));
		orders.setRoadAddress(request.getParameter("roadAddress"));
		orders.setDetailAddress(request.getParameter("detailAddress"));
		
//		logger.info(orders.getUserId());
//		logger.info(orders.getRoadAddress());
//		logger.info(orders.getDetailAddress());
		ordersService.saveOrder(orders);
		
		OrderProducts orderProducts = new OrderProducts();
		
		for(int i = 0; i < cartArray.length; i++) {
			if(cartArray[i].getProductName() == null) {
				break;
			}
			else{
				//logger.info(String.valueOf(cartArray[i].getProductNo()));
				orderProducts.setProductNo(cartArray[i].getProductNo());
				orderProducts.setUserId(cartArray[i].getUserId());
				orderProducts.setAmount(cartArray[i].getAmount());
				orderProducts.setPrice(cartArray[i].getAllPrice());
//				
//				logger.info(String.valueOf(orderProducts.getProductNo()));
//				logger.info(orderProducts.getUserId());
				
				orderProductsService.saveOrderProduct(orderProducts);
				cartService.deleteCart(orderProducts.getProductNo(), orderProducts.getUserId());
			} 
		}		
		
		return "order/ordercomplete";
	}

	@GetMapping("/wishlist")
	public String openWishlist(Authentication auth,String pageNo, Model model, HttpSession session) {

		int intPageNo = 1;
		if (pageNo == null) {
			// 세션에서 Pager를 찾고, 있으면 pageNo를 설정하고,
			Pager pager = (Pager) session.getAttribute("pager");
			if (pager != null) {
				intPageNo = pager.getPageNo();
			}
			// 없으면 Pager를 세션에 저장함
		} else {
			intPageNo = Integer.parseInt(pageNo);
		}

		/*Wishlist wishlist = new Wishlist();
		wishlist.setUserId("a3@gmail.com");
		wishlist.setProductNo(intPageNo);*/

		int totalRows = wishlistService.getTotalRows();
		Pager pager = new Pager(12, 10, totalRows, intPageNo);
		session.setAttribute("pager", pager);

		String userId = auth.getName();
		List<Wishlist> list = wishlistService.getWishlist(pager,userId);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);

		return "order/wishlist";
	}

	@PostMapping("/addwishlist")
	public String addWishList(Wishlist wishlist) {
		
		boolean check = true;
		wishlist.setUserId("a1@gmail.com");

		List<Wishlist> list = wishlistService.getWishlist();
		logger.info(String.valueOf(list.get(0).getProductNo()));
		logger.info(String.valueOf(list.get(0).getUserId()));

		for(int i=0; i<list.size(); i++) { 
			if(list.get(i).getProductNo() == wishlist.getProductNo() 
					&& list.get(i).getUserId().equals(wishlist.getUserId())) {
				logger.info("찾음");
				logger.info("찾음");
				logger.info("찾음");
				logger.info("찾음");
				logger.info("찾음");
				check = false; 
				break; 
			} 
		}
		
		if(check == true) {
			int result = wishlistService.saveWishlist(wishlist);;
		}else {
			logger.info("false다");
		}

		return "redirect:/product?productNo=" + wishlist.getProductNo();
	}

	@GetMapping("/delwishlist")
	public String delWishList(int productNo, Authentication auth) {
		/*logger.info(String.valueOf(productNo));*/

		String userId = auth.getName();
		wishlistService.deleteWishlist(productNo, userId);
		
		return "redirect:/user/wishlist";
	}


}
