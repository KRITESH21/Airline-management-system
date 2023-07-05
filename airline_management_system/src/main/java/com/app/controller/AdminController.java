package com.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.pojos.Bookings;
import com.app.pojos.Hotels;
import com.app.pojos.Images;
import com.app.pojos.Packages;
import com.app.pojos.Users;
import com.app.pojos.Worker;
import com.app.service.AdminServiceInterface;
import com.app.utility.DutySender;

@Controller
@RequestMapping("/Admin")
public class AdminController {

	@Autowired
	private AdminServiceInterface adminService;

	public AdminController() {
		System.out.println("in constr of " + getClass().getName());
	}

	@GetMapping("/Dashboard")
	public String showDahboard(HttpSession hs) {
		int count1 = 0;
		List<Images> list1 = adminService.fetchAllImages();
		for (Images i : list1) {
			count1 = count1 + 1;
		}
		hs.setAttribute("totalImages", count1);
		int count2 = 0;
		List<Packages> list2 = adminService.fetchAllPackages();
		for (Packages p : list2) {
			count2 = count2 + 1;
		}
		hs.setAttribute("totalPackages", count2);
		int count3 = 0;
		List<Bookings> list3 = adminService.fetchAllBooking();
		for (Bookings b : list3) {
			count3 = count3 + 1;
		}
		hs.setAttribute("totalBookings", count3);
		int count4 = 0;
		List<Users> list4 = adminService.FetchUsers();
		for (Users u : list4) {
			count4 = count4 + 1;
		}
		hs.setAttribute("userCount", count4);
		return "/Admin/Dashboard";
	}

	@GetMapping("/userFeedback")
	public String userFeedback(HttpSession hs) {
		hs.setAttribute("feedback", adminService.fetchAllFeedback());
		return "/Admin/userFeedback";
	}

	@GetMapping("/watchBookings")
	public String watchBookings(HttpSession hs) {
		hs.setAttribute("booking", adminService.fetchAllBooking());
		return "/Admin/watchBookings";
	}

	@GetMapping("/contactUs")
	public String contactUs(HttpSession hs) {
		hs.setAttribute("contactus", adminService.fetchAllContactUs());
		return "/Admin/contactUs";
	}

	@GetMapping("/addImages")
	public String addImages(HttpSession hs) {
		hs.setAttribute("imageList", adminService.fetchAllImages());
		return "/Admin/addImages";
	}

	@GetMapping("/image_delete")
	public String deleteImage(@RequestParam int pid, RedirectAttributes flashMap) {
		flashMap.addFlashAttribute("message", adminService.removeImage(pid));
		return "redirect:/Admin/addImages";
	}

	@PostMapping("/addImage")
	public String processAddImages(@RequestParam MultipartFile image, @RequestParam String description, HttpSession hs,
			RedirectAttributes flashMap) throws IOException {
		byte[] imageFile = image.getBytes();
		Images image1 = new Images(imageFile, description);
		flashMap.addFlashAttribute("message", adminService.addImage(image1));
		return "redirect:/Admin/addImages";
	}

	@GetMapping("/addPackages")
	public String addPackages() {
		return "/Admin/addPackages";
	}

	@PostMapping("/addPackage")
	public String processaddPackage(HttpSession hs, RedirectAttributes flashMap, Model modelMap,
			@RequestParam String title, @RequestParam String details, @RequestParam String price,
			@RequestParam String fromto, @RequestParam int rating, @RequestParam MultipartFile image)
			throws IOException {
		byte[] imageFile = image.getBytes();
		Packages package1 = new Packages(title, details, price, fromto, rating, imageFile);
		System.out.println(package1);
		flashMap.addFlashAttribute("message", adminService.addPackage(package1));
		return "redirect:/Admin/viewPackages";
	}

	@GetMapping("/viewPackages")
	public String viewPackages(HttpSession hs) {
		hs.setAttribute("packages", adminService.fetchAllPackages());
		return "/Admin/viewPackages";
	}

	@GetMapping("/package_delete")
	public String delete1Image(@RequestParam int pid, RedirectAttributes flashMap, Model modelMap) {
		try {
			flashMap.addFlashAttribute("message", adminService.deletePackage(pid));
			return "redirect:/Admin/viewPackages";
		} catch (Exception e) {
			modelMap.addAttribute("message", "Can not Delete the packages already booked by Customers");
			return "/Admin/viewPackages";
		}
	}

	@GetMapping("/updateBooking")
	public String updateBooking(@RequestParam int bid, RedirectAttributes flashMap, HttpSession hs) {
		hs.setAttribute("booking", adminService.fetchBookingById(bid));
		return "/Admin/updateBooking";
	}

	@PostMapping("/updateBooking")
	public String updateProcess(@RequestParam String startdate, @RequestParam String enddate, @RequestParam int bid,
			RedirectAttributes flashMap) {
		flashMap.addFlashAttribute("message", adminService.updatebooking(bid, startdate, enddate));
		return "redirect:/Admin/watchBookings";
	}

	@GetMapping("/workers")
	public String showWorkers(HttpSession hs) {

		hs.setAttribute("workers", adminService.getAllWorkers());
		return "/Admin/workers";
	}

	@PostMapping("/importeorkers")
	public String mapReapExcelDatatoDB(@RequestParam MultipartFile efile, Model modelMap, RedirectAttributes flashMap)
			throws IOException {
		XSSFWorkbook workbook = new XSSFWorkbook(efile.getInputStream());
		XSSFSheet worksheet = workbook.getSheetAt(0);
		for (int i = 1; i < worksheet.getPhysicalNumberOfRows(); i++) {
			Worker w = new Worker();
			XSSFRow row = worksheet.getRow(i);
			String name = "" + row.getCell(0);
			w.setName(name);
			String email = "" + row.getCell(1);
			w.setEmail(email);
			w.setMobile("" + row.getCell(2));
			w.setPost("" + row.getCell(3));
			String duty = "" + row.getCell(4);
			w.setDuty(duty);

			adminService.loadWorkers(w);
			DutySender ps = new DutySender();
			ps.sendEmail(email, duty);

		}
		int count = worksheet.getPhysicalNumberOfRows() - 1;
		flashMap.addFlashAttribute("message", "Total Loaded Workers" + count);
		return "redirect:/Admin/workers";
	}

	@GetMapping("/removeWorkers")
	public String removeallWorkers(RedirectAttributes flashMap) {
		flashMap.addFlashAttribute("message", adminService.removeWorkers());
		return "redirect:/Admin/workers";
	}

	@GetMapping("/hotels")
	public String showhotels(HttpSession hs) {
		List<Hotels> list1= adminService.fetchAllHotels();
		hs.setAttribute("hotellist",list1 );
		return "/Admin/hotels";
	}

	@PostMapping("/addhotel")
	public String addHotels(@RequestParam String title, @RequestParam String type, @RequestParam String rating,
			@RequestParam String mobile, @RequestParam String km, @RequestParam String city,
			@RequestParam MultipartFile image, RedirectAttributes flashMap, Model modelMap) throws IOException {
		byte[] imageFile = image.getBytes();
		Hotels hotel = new Hotels(title, type, rating, mobile, km, city, imageFile);
		flashMap.addFlashAttribute("message", adminService.saveHotel(hotel));
		return "redirect:/Admin/hotels";
	}
	
	@GetMapping("hotel_delete")
	public String removeHotel(@RequestParam int hid,RedirectAttributes flashMap,Model modelMap) {
		flashMap.addFlashAttribute("message", adminService.removehotel(hid));
		return "redirect:/Admin/hotels";
	}
}
