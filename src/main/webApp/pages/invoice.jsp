<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="images/favicon.png" rel="icon" />
    <title>General Invoice - Koice</title>
    <meta name="author" content="harnishdesign.net" />

    <!-- Web Fonts
======================= -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
      type="text/css"
    />

    <!-- Stylesheet
======================= -->
    <link
      rel="stylesheet"
      type="text/css"
      href="/vendor/bootstrap/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="/vendor/font-awesome/all.min.css"
    />
    <link rel="stylesheet" type="text/css" href="/CSS/stylesheet.css" />
    
    <style>
    	.btn-primary,
		.btn-primary:active {
		  background-color: #47b5ed !important;
		  border-color: #47b5ed !important;
		  color: #ffffff !important;
		}
		
		.bg-primary {
		  background-color: #47b5ed !important;
		}
		
		.text-primary {
		  color: #47b5ed !important;
		}
		
		.btn-outline-primary{
			background-color: transparent !important;
			border-color: #40b0bf;
			color: #40b0bf;
		}
		
		.btn-outline-primary:hover{
			color: black;
		}
		
    </style>
    
  </head>
  <body>
    <!-- Container -->
    <div class="container-fluid invoice-container">
      <!-- Header -->
      <header>
        <div class="row align-items-center">
          <div class="col-sm-7 text-center text-sm-start mb-3 mb-sm-0">
           Software Buddy
          </div>
          <div class="col-sm-5 text-center text-sm-end">
            <h4 class="text-7 text-primary mb-0">Invoice</h4>
          </div>
        </div>
        <hr />
      </header>

      <!-- Main Content -->
      <main>
        <div class="row">
          <div class="col-sm-6"><strong>Date:</strong> ${order.purchased_date }</div>
          <div class="col-sm-6"><strong>Order Id:</strong> ${order.order_id }</div>
          <!-- <div class="col-sm-6 text-sm-end">
            <strong>Invoice No:</strong> 16835
          </div> -->
        </div>
        <hr />
        <div class="row">
          <div class="col-sm-6 text-sm-end order-sm-1">
            <strong>Pay To:</strong>
            <address>
              Software Buddy<br />
            </address>
          </div>
          <div class="col-sm-6 order-sm-0">
            <strong>Invoiced To:</strong>
            <address>
              ${userLogged.name}<br />
              ${user.mobileNo }
              
            </address>
          </div>
        </div>

        <div class="card">
          <div class="card-body p-0">
            <div class="table-responsive">
              <table class="table mb-0">
                <thead class="card-header bg-primary text-light">
                  <tr>
                    <td class="col-3"><strong>Service</strong></td>
                    <td class="col-4"><strong>Description</strong></td>
                    <td class="col-2 text-center"><strong>Rate</strong></td>
                    
                    <td class="col-2 text-end"><strong>Amount</strong></td>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${order.ordered_products}" var="product">
                
                  <tr>
                    <td class="col-3">${product.name }</td>
                    <td class="col-4 text-1">${product.description}</td>
                    <td class="col-2 text-center">${tax}/-</td>
                    <td class="col-2 text-end">${product.price}/-</td>
                  </tr>
                </c:forEach>
                  
                  
                </tbody>
                <tfoot class="card-footer">
                  <tr>
                    <td colspan="3" class="text-end">
                      <strong>Sub Total:</strong>
                    </td>
                    <td class="text-end">${totalAmount}/-</td>
                  </tr>
                  <tr>
                    <td colspan="3" class="text-end"><strong>Tax:</strong></td>
                    <td class="text-end">${tax}/-</td>
                  </tr>
                  <tr>
                    <td colspan="3" class="text-end border-bottom-0">
                      <strong>Total:</strong>
                    </td>
                    <td class="text-end border-bottom-0">${totalAmount}/-</td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div>
      </main>
      <!-- Footer -->
      <footer class="text-center mt-4">
        <p class="text-1">
          <strong>NOTE :</strong> This is computer generated receipt and does
          not require physical signature.
        </p>
        <div class="btn-group btn-group-sm d-print-none">
          <a
            href="javascript:window.print()"
            class="btn btn-primary border  shadow-none"
            >Download</a
          >
          
          <a class="btn btn-outline-primary" href="/">Home</a>
        </div>
      </footer>
    </div>
  </body>
</html>
