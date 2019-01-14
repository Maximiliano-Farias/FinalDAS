package ar.edu.ubp.das.src.tags;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.Dao;
import ar.edu.ubp.das.mvc.db.DaoFactory;

public class CritBusqVideosTagHandler extends SimpleTagSupport {

	private String onClick1;
	private String onClick2;
	
	@Override
	public void doTag() throws JspException, IOException {
		super.doTag();

		JspWriter out = this.getJspContext().getOut();
				  out.println("<fieldset>");	
				
        try {
        	String lang = String.valueOf(this.getJspContext().getAttribute("lang", PageContext.SESSION_SCOPE));
        	
            Locale.setDefault(new Locale(lang));
            ResourceBundle bundle = ResourceBundle.getBundle("ar.edu.ubp.das.src.videos.properties.etiquetas");

        
            DynaActionForm form = new DynaActionForm();
                           form.setItem("lang", lang);
                           
            Dao dao = DaoFactory.getDao("Logueo", "tags");
                 out.println("<div id=\"Logueado\" name=\"Logueado\"></div>");
            	 out.println("<label for=\"us\" id=\"us\">" + bundle.getString("usuario") + " </label><input type=\"text\" name=\"usuario\" id=\"usuario\" text=\"\" value=\"\" maxlength=\"30\" size=\"20\" />");
                 out.println("<label for=\"con\"id=\"con\">" + bundle.getString("contrasena") + "</label><input type=\"password\" name=\"contrasena\" id=\"contrasena\" text=\"\"  value=\"\" maxlength=\"30\" size=\"20\" />");
                 out.println("<label for=\"datos\"></label>");
                 
            out.println("<input type=\"image\" id=\'entrar-img\'name=\'entrar-img\'src='/img/entrar-icon.png' title=\"" + bundle.getString("entrar") + "\" onclick=\"" + this.onClick1 + "\"/>");
            out.println("<label for=\"soy_nuevo\" id=\"soy_nuevo\" Onclick= \"jGobierno.soyNuevo()\">"+ bundle.getString("soy_nuevo") +"</label>");
            out.println("<div class=\"fr\" id=\"idiomas\"><a href=\"/gobierno/Content.do/lang=es\"><fmt:message key=\"espanol\"/>" + bundle.getString("espanol") + "</a> / <a href=\"/gobierno/Content.do/lang=en\"><fmt:message key=\"ingles\" />"+ bundle.getString("ingles") + "</a></span>");
        
        }
		catch(SQLException ex) {
	        out.println(ex.getMessage());
		}
        finally {
			out.println("</fieldset>");	
            
        }
	}
	
	public void setOnClick1(String onClick) {
		this.onClick1 = onClick;
	}
	
	public void setOnClick2(String onClick) {
		this.onClick2 = onClick;
	}
	
}
