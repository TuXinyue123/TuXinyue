package com.tuxinyue.week2.homework;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // 👇 这里改成你的真实姓名
        out.println("Name : tuxinyue<br>");
        // 👇 这里改成你的真实学号
        out.println("ID : 2024061010000503<br>");
        out.println("Date and Time : 2026-3-16" + new Date());
    }
}
