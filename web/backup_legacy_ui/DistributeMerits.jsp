<%@page import="java.util.List" %>
    <%@page import="com.lab.model.Event" %>
        <%@page import="com.lab.dao.MeritDAO" %>
            <%@page contentType="text/html" pageEncoding="UTF-8" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                    <title>Distribute Merits | SERS Administrations</title>
                    <link href="${pageContext.request.contextPath}/resources/vendor/css/core.css" rel="stylesheet">
                    <link href="${pageContext.request.contextPath}/resources/css/css.css" rel="stylesheet">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
                </head>

                <body class="bg-light">

                    <div class="d-flex" id="wrapper">
                        <!-- HEPA Sidebar Context -->
                        <jsp:include page="sidebar.jsp" />


                        <!-- Page Content -->
                        <div id="page-content-wrapper" class="w-100">
                            <nav
                                class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm py-3 px-4">
                                <div class="container-fluid">
                                    <h4 class="mb-0 text-dark fw-bold"><i class="fas fa-award text-success me-2"></i>
                                        System Merit Distribution</h4>
                                    <a href="Homepage.jsp" class="btn btn-outline-secondary btn-sm"><i
                                            class="fas fa-arrow-left"></i> Admins Console</a>
                                </div>
                            </nav>

                            <div class="container-fluid p-4">

                                <% if(request.getParameter("success") !=null) { %>
                                    <div class="alert alert-success d-flex align-items-center shadow-sm" role="alert">
                                        <i class="fas fa-check-circle fa-2x me-3"></i>
                                        <div>
                                            <strong>Merits Distributed Successfully!</strong><br>
                                            Students have automatically received their event points on their immutable
                                            transcript.
                                        </div>
                                    </div>
                                    <% } %>

                                        <div class="alert alert-info border-0 shadow-sm bg-primary-soft text-dark mb-4">
                                            <i class="fas fa-info-circle me-2 text-primary"></i> Select a finalized
                                            event below to systematically drop merit points to its verified attendees.
                                            Doing this locks the specific event transcript permanently.
                                        </div>

                                        <div class="card shadow-sm border-0">
                                            <div class="card-body p-0">
                                                <div class="table-responsive">
                                                    <table class="table table-hover align-middle mb-0">
                                                        <thead class="bg-light text-muted small text-uppercase">
                                                            <tr>
                                                                <th class="ps-4">Identifier</th>
                                                                <th>Event Details</th>
                                                                <th>Criteria Info</th>
                                                                <th>Status</th>
                                                                <th class="text-end pe-4">Execute Distribution</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <% List<Event> approvedEvents = (List<Event>)
                                                                    request.getAttribute("approvedEvents");
                                                                    MeritDAO meritDAO = (MeritDAO)
                                                                    request.getAttribute("meritDAO");

                                                                    if(approvedEvents != null &&
                                                                    !approvedEvents.isEmpty()) {
                                                                    for(Event e : approvedEvents) {
                                                                    boolean isAlreadyDistributed =
                                                                    meritDAO.isDistributed(e.getEventId());
                                                                    %>

                                                                    <% String temporary=isAlreadyDistributed
                                                                        ? "opacity-75 bg-light" : "" ; %>
                                                                        <tr class="<%= temporary %>">
                                                                            <td class="ps-4">
                                                                                <span class="badge bg-secondary">#EVENT-
                                                                                    <%= e.getEventId() %>
                                                                                </span>
                                                                            </td>
                                                                            <td>
                                                                                <strong class="d-block text-dark">
                                                                                    <%= e.getEventName() %>
                                                                                </strong>
                                                                                <span class="small text-muted"><i
                                                                                        class="fas fa-flag text-primary me-1"></i>
                                                                                    <%= e.getClubName() %>
                                                                                </span>
                                                                            </td>
                                                                            <td>
                                                                                <span
                                                                                    class="badge bg-info-soft text-info"><i
                                                                                        class="fas fa-bullseye me-1"></i>
                                                                                    <%= e.getCriteria() %> | <%=
                                                                                            e.getCategory() %>
                                                                                </span>
                                                                            </td>
                                                                            <td>
                                                                                <% if(isAlreadyDistributed) { %>
                                                                                    <span class="badge bg-success"><i
                                                                                            class="fas fa-lock me-1"></i>
                                                                                        LOGGED</span>
                                                                                    <% } else { %>
                                                                                        <span
                                                                                            class="badge bg-warning text-dark"><i
                                                                                                class="fas fa-hourglass-start me-1"></i>
                                                                                            PENDING MASS-PAYOUT</span>
                                                                                        <% } %>
                                                                            </td>
                                                                            <td class="text-end pe-4">
                                                                                <% if(isAlreadyDistributed) { %>
                                                                                    <button
                                                                                        class="btn btn-sm btn-secondary shadow-sm"
                                                                                        disabled><i
                                                                                            class="fas fa-check-double me-1"></i>
                                                                                        Points Sent</button>
                                                                                    <% } else { %>
                                                                                        <form
                                                                                            action="MeritController?action=distributeMerits"
                                                                                            method="POST"
                                                                                            class="d-inline-flex gap-2 align-items-center"
                                                                                            onsubmit="return confirm('WARNING: You are about to mass distribute points to all physically verified attendees for <%= e.getEventName() %>. This is immutable. Proceed?'
                                                                                        );">
                                                                                            <input type="hidden"
                                                                                                name="eventId"
                                                                                                value="<%= e.getEventId() %>">
                                                                                            <div
                                                                                                class="input-group input-group-sm w-auto shadow-sm">
                                                                                                <span
                                                                                                    class="input-group-text bg-light text-muted"><i
                                                                                                        class="fas fa-star"></i></span>
                                                                                                <input type="number"
                                                                                                    name="points"
                                                                                                    class="form-control"
                                                                                                    style="width: 80px;"
                                                                                                    min="1" max="100"
                                                                                                    value="10" required>
                                                                                            </div>
                                                                                            <button type="submit"
                                                                                                class="btn btn-sm btn-success fw-bold shadow-sm px-3"><i
                                                                                                    class="fas fa-bolt me-1"></i>
                                                                                                Issue Points</button>
                                                                                        </form>
                                                                                        <% } %>
                                                                            </td>
                                                                        </tr>
                                                                        <% } } else { %>
                                                                            <tr>
                                                                                <td colspan="5"
                                                                                    class="text-center py-5 text-muted">
                                                                                    <i
                                                                                        class="fas fa-clipboard-check fa-3x mb-3 text-light"></i><br>
                                                                                    No approved events available.
                                                                                </td>
                                                                            </tr>
                                                                            <% } %>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                            </div>
                        </div>
                    </div>

                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>