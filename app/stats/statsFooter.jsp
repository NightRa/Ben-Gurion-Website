<%--Created by Ilan Godik--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Lots of scary boxing-unboxing NPE risks
    Long startTime = (Long) request.getAttribute("startTime");
    if (startTime != 0) {
        long end = System.nanoTime();
        long time = end - startTime;

        Long oldTotalTime = (Long) application.getAttribute("totalTime");
        if (oldTotalTime == null) {
            application.setAttribute("totalTime", time);
            application.setAttribute("timeRecords", 1);
        } else {
            Integer timeRecords = (Integer) application.getAttribute("timeRecords");
            if (timeRecords == null) {
                timeRecords = 0;
            }
            application.setAttribute("totalTime", oldTotalTime + time);
            application.setAttribute("timeRecords", timeRecords + 1);
        }
    }
%>
