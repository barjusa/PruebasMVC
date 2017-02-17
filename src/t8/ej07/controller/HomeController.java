package t8.ej07.controller;

import javax.servlet.annotation.WebServlet;

import org.mvc.Controller;

@SuppressWarnings("serial")
@WebServlet({"/home","/home/","/home/*"})
public class HomeController extends Controller{
	public void indexGet(){
		view("home/indexGet.jsp");
	}
}
