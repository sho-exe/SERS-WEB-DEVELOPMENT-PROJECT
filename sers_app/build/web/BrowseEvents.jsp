<%@page import="java.util.List" %>
    <%@page import="com.lab.model.Event" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <title>Event Catalog | SERS</title>
                <link href="${pageContext.request.contextPath}/resources/vendor/css/core.css" rel="stylesheet">
                <link href="${pageContext.request.contextPath}/resources/css/css.css" rel="stylesheet">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
                <style>
                    .event-card {
                        transition: transform 0.3s ease, box-shadow 0.3s ease;
                        border-radius: 15px;
                        border: none;
                    }

                    .event-card:hover {
                        transform: translateY(-5px);
                        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1) !important;
                    }

                    .date-badge {
                        background: #f8f9fa;
                        border-radius: 10px;
                        width: 65px;
                        height: 65px;
                        text-align: center;
                        display: flex;
                        flex-direction: column;
                        justify-content: center;
                        box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.05);
                    }

                    .date-badge .month {
                        font-size: 0.75rem;
                        font-weight: bold;
                        text-transform: uppercase;
                        color: var(--danger);
                        line-height: 1;
                    }

                    .date-badge .day {
                        font-size: 1.5rem;
                        font-weight: 900;
                        color: var(--dark);
                        line-height: 1;
                        margin-top: 2px;
                    }
                </style>
            </head>

            <body class="bg-light">

                <div class="d-flex" id="wrapper">
                    <!-- Student Sidebar -->
                    <jsp:include page="sidebar.jsp" />


                    <!-- Page Content -->
                    <div id="page-content-wrapper" class="w-100">
                        <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm py-3 px-4">
                            <div class="container-fluid">
                                <h4 class="mb-0 text-dark fw-bold"><i class="fas fa-compass text-info me-2"></i> Explore
                                    Campus Events</h4>
                                <a href="Homepage.jsp" class="btn btn-outline-secondary btn-sm"><i
                                        class="fas fa-arrow-left"></i> Back to Dashboard</a>
                            </div>
                        </nav>

                        <div class="container-fluid p-4">

                            <div class="row row-cols-1 row-cols-md-2 row-cols-xl-3 g-4">
                                <% List<Event> eventCatalog = (List<Event>) request.getAttribute("eventCatalog");
                                        if(eventCatalog != null && !eventCatalog.isEmpty()) {
                                        for(Event e : eventCatalog) {

                                        // Simple parsing for aesthetic date badges assuming format YYYY-MM-DD
                                        String[] dParts = e.getDate().toString().split("-");
                                        String[] months = {"JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG",
                                        "SEP", "OCT", "NOV", "DEC"};
                                        String mo = months[Integer.parseInt(dParts[1]) - 1];
                                        String dy = dParts[2];

                                        boolean isFull = e.getCurrentEnrollments() >= e.getQuota();
                                        int spotsLeft = e.getQuota() - e.getCurrentEnrollments();
                                        %>

                                        <div class="col">
                                            <div class="card h-100 event-card shadow-sm">
                                                <div class="card-body p-4">
                                                    <div class="d-flex justify-content-between border-bottom pb-3 mb-3">
                                                        <div>
                                                            <span class="badge bg-primary-soft text-primary mb-2"><i
                                                                    class="fas fa-flag me-1"></i>
                                                                <%= e.getClubName() %>
                                                            </span>
                                                            <h5 class="card-title fw-bold text-dark mb-0 line-clamp-2">
                                                                <%= e.getEventName() %>
                                                            </h5>
                                                        </div>
                                                        <div class="date-badge ms-3 flex-shrink-0">
                                                            <span class="month">
                                                                <%= mo %>
                                                            </span>
                                                            <span class="day">
                                                                <%= dy %>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <p class="card-text text-muted small mb-4"
                                                        style="min-height: 60px;">
                                                        <%= e.getDescription() %>
                                                    </p>

                                                    <div class="rounded bg-light p-3 mb-4">
                                                        <div class="d-flex mb-2 small fw-bold text-secondary">
                                                            <i class="fas fa-map-marker-alt text-danger me-2 mt-1"></i>
                                                            <span>
                                                                <%= e.getVenue() %>
                                                            </span>
                                                        </div>
                                                        <div class="d-flex small fw-bold text-secondary">
                                                            <i class="fas fa-bullseye text-success me-2 mt-1"></i>
                                                            <span>Merit Tier: <%= e.getCriteria() %> | Category: <%= e.getCategory() %></span>
                                                        </div>
                                                    </div>

                                                    <div
                                                        class="d-flex justify-content-between align-items-center mt-auto">
                                                        <div>
                                                            <div class="small fw-bold text-dark"><i
                                                                    class="fas fa-user-friends text-info me-1"></i>
                                                                <%= e.getCurrentEnrollments() %> / <%= e.getQuota() %>
                                                            </div>
                                                            <% if(!isFull && !e.isAlreadyRegistered()) { %>
                                                                <div class="small text-success fw-bold">
                                                                    <%= spotsLeft %> Spots Left!
                                                                </div>
                                                                <% } else if(isFull && !e.isAlreadyRegistered()) { %>
                                                                    <div class="small text-danger fw-bold">Fully Booked
                                                                    </div>
                                                                    <% } %>
                                                        </div>

                                                        <div>
                                                            <% if (e.isAlreadyRegistered()) { %>
                                                                <button class="btn btn-success disabled shadow-sm"
                                                                    disabled>
                                                                    <i class="fas fa-check-circle me-1"></i> Enrolled
                                                                </button>
                                                                <% } else if (isFull) { %>
                                                                    <button class="btn btn-secondary disabled shadow-sm"
                                                                        disabled>
                                                                        <i class="fas fa-ban me-1"></i> Filled
                                                                    </button>
                                                                    <% } else { %>
                                                                        <% String confirmMsg="Register for " +
                                                                            e.getEventName().replace("'", "\\'" ) + "?"
                                                                            ; %>
                                                                            <form action="BrowseEventsServlet"
                                                                                method="POST" class="m-0"
                                                                                onsubmit="return confirm('<%= confirmMsg %>');">
                                                                                <input type="hidden" name="action"
                                                                                    value="register">
                                                                                <input type="hidden" name="eventId"
                                                                                    value="<%= e.getEventId() %>">
                                                                                <button type="submit"
                                                                                    class="btn btn-primary shadow-sm fw-bold">
                                                                                    Sign Up <i
                                                                                        class="fas fa-arrow-right ms-1"></i>
                                                                                </button>
                                                                            </form>
                                                                            <% } %>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <% } } else { %>
                                            <div class="col-12 text-center py-5 text-muted w-100">
                                                <i class="fas fa-map text-light fa-4x mb-3"></i>
                                                <h5 class="fw-bold">No Events Found</h5>
                                                <p>There are currently no approved campus events to sign up for. Check
                                                    back soon!</p>
                                            </div>
                                            <% } %>
                            </div>

                        </div>
                    </div>
                </div>

                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>