package ar.edu.ubp.das.src.gobierno.actions;

import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.edu.ubp.das.mvc.action.Action;
import ar.edu.ubp.das.mvc.action.ActionMapping;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.config.ForwardConfig;
import ar.edu.ubp.das.mvc.db.Dao;
import ar.edu.ubp.das.mvc.db.DaoFactory;

public class GanadorSorteoAction implements Action {

	@Override
	public ForwardConfig execute(ActionMapping mapping, DynaActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, RuntimeException {
	form.setItem("idioma", String.valueOf(request.getSession().getAttribute("lang")));
		
		Dao dao = DaoFactory.getDao("GanadorSorteo", "gobierno");
		request.setAttribute("respuesta", dao.select(form));
		response.setContentType("text/html;charset=ISO-8859-1");
		return mapping.getForwardByName("success");
	}

}
