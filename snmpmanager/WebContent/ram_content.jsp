<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="snmp.*"%>
<%@page import="java.util.*" %>
<%@page import="java.time.*" %>
<%@page import="java.text.*" %>
<!DOCTYPE html>
<html lang="en">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
 <jsp:include page="/ram_servlet" />

 
      

             <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Ram Usage</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>IP Address</th>
                      <th>Ram Usage</th>
                      <th>Last up dated time</th>

                    </tr>
                  </thead>

                  <tbody>
                 <% ArrayList data=(ArrayList)request.getAttribute("data");	
					for ( int i=0;i<data.size();i++)	{%>
					<tr>
					
						<% m_bean d = (m_bean)data.get(i);%>
						<td>
						<%=d.getip()%>
                   		</td>
                      
                      <td><h4 class="small font-weight-bold">Memory Usage<span class="float-right"><%=d.getram_usage() %>%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: <%=d.getram_usage() %>%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                  </div></td>
					<td>
					<%=d.getlut()%>
					</td>
					<%} %>
                    </tr>
                   

                  </tbody>
                </table>
              </div>
            </div>
          </div>
          


    
    <!-- End of Content Wrapper -->

 
  <!-- End of Page Wrapper -->



  <!-- Logout Modal-->
  