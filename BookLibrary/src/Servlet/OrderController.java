package Servlet;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.instamojo.wrapper.api.ApiContext;
import com.instamojo.wrapper.api.Instamojo;
import com.instamojo.wrapper.api.InstamojoImpl;
import com.instamojo.wrapper.model.PaymentOrder;
import com.instamojo.wrapper.model.PaymentOrderResponse;

@WebServlet("/OrderController")
public class OrderController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try 
	       {
	           ApiContext context = ApiContext.create("test_2G6TR54EXOT0ZmAsHDwXx6reiUF4DgDatxz", "test_GJQLOnnsdDhrCkldHL2HQjcjTiVN1H9BQeBF9rvVvmBNBXnz1jqGn3JZ6JT9y56GHxFWhmEUcDqOTnMb9Rv4aAujxyY31xjdag9RxHMmn46bu7LRyscNHYvMLnk", ApiContext.Mode.TEST);
	           Instamojo api = new InstamojoImpl(context);

	           PaymentOrder order = new PaymentOrder();
	           order.setName("Mohammad");
	           order.setEmail("nedariyamohd36@gmail.com");
	           order.setPhone("8169721827");
	           order.setCurrency("INR");
	           order.setAmount((double)11);
	           order.setDescription("Description");
	           order.setRedirectUrl("https://www.google.com");
	           order.setWebhookUrl("https://www.google.com");
	           order.setTransactionId(UUID.randomUUID().toString());

	           PaymentOrderResponse paymentOrderResponse = api.createPaymentOrder(order);
	           resp.sendRedirect(paymentOrderResponse.getPaymentOptions().getPaymentUrl());
	       }
	       catch (Exception e) 
	       {
	           System.out.println(e);
	       }
	}
	
	
  
}
