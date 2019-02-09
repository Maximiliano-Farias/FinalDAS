package ar.edu.ubp.das.mvc.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.src.concesionarias.beans.ConcesionariaBean;

public interface Dao {

    public DynaActionForm make(ResultSet result) throws SQLException;
    public String insert(ConcesionariaBean respuestaConcesionaria) throws SQLException;
    public void update(DynaActionForm form) throws SQLException;
    public void delete(DynaActionForm form) throws SQLException;
    public DynaActionForm select(DynaActionForm form) throws SQLException;
    public boolean valid(DynaActionForm form) throws SQLException;

}
