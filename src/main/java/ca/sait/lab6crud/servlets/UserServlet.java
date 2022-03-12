package ca.sait.lab6crud.servlets;

import ca.sait.lab6crud.models.Role;
import ca.sait.lab6crud.models.User;
import ca.sait.lab6crud.services.RoleService;
import ca.sait.lab6crud.services.UserService;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Process the user data from/to MariaDB
 * @author Alan(Dong O) Kim
 */
public class UserServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService service = new UserService();
        
        try {
            List<User> users = service.getAll();
            
            request.setAttribute("users", users);
            
            this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        UserService us = new UserService();
        RoleService rs = new RoleService();
        Role roles = null; //new Role(); //null;
        
        if (action != null && action.equals("create")) {  //add
            String email = request.getParameter("email");
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String password = request.getParameter("password");
            int roleId = Integer.parseInt(request.getParameter("role"));
            
            try {
                String roleName = rs.getName(roleId);
                roles = new Role(roleId, roleName);
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                us.insert(email, true, firstname, lastname, password, roles);
                session.setAttribute("message", email + " has been created.");
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else  if (action != null && action.equals("update")) {
            String email = request.getParameter("email");

            try {
                User users = (User) us.get(email);
                roles = users.getRole();
                
                request.setAttribute("input_email", users.getEmail());
                if (users.isActive()) {
                    request.setAttribute("input_active", 1);
                }

                request.setAttribute("input_firstname", users.getFirstName());
                request.setAttribute("input_lastname", users.getLastName());
                request.setAttribute("input_role", roles.getId());
                
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else  if (action != null && action.equals("edit")) {
            String email = request.getParameter("email");
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String password = request.getParameter("password");
            int roleId = Integer.parseInt(request.getParameter("role"));
            
            try {
                String roleName = rs.getName(roleId);
                roles = new Role(roleId, roleName);
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            try {
                us.update(email, true, firstname, lastname, password, roles);
                session.setAttribute("message", email + " has been edited.");
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }  
        } else  if (action != null && action.equals("delete")) {
            String email = request.getParameter("email");
            
            try {
                if (us.delete(email)) {
                    session.setAttribute("message", email + " has been deleted.");
                }
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else  if (action != null && action.equals("cancel")) {
            request.getSession().setAttribute("email", null);
            request.getSession().setAttribute("firstname", null);
            request.getSession().setAttribute("lastname", null);
            request.getSession().setAttribute("active", 0);
            request.getSession().setAttribute("role", 0);
            request.getSession().setAttribute("role", null);
        }
        
        this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }

}
