package ar.edu.ubp.das.mvc.db;

import java.sql.ResultSet;
import java.sql.SQLException;


import ar.edu.ubp.das.forms.ConcesionariaBean;
import ar.edu.ubp.das.mvc.action.DynaActionForm;

public interface Dao {

    public DynaActionForm make(ResultSet result) throws SQLException;
    public void insert(DynaActionForm form) throws SQLException;
    public void update(DynaActionForm form) throws SQLException;
    public void delete(DynaActionForm form) throws SQLException;
    public ConcesionariaBean select() throws SQLException;
    public boolean valid(DynaActionForm form) throws SQLException;

}
