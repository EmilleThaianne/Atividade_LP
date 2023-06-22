package pessoa.sql.DAO;

import CONEXAO.Conexao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import pessoa.sql.Pessoa;

public class DAO {

    Connection conexao = null;
    PreparedStatement sql = null;
    ResultSet rset = null;

    public int inserir(Pessoa pessoa) {

        StringBuilder sqlBuilder = new StringBuilder();
        sqlBuilder
                .append("INSERT INTO pessoa ( nome, data_nascimento) ")
                .append("VALUES (?, ?)");

        String insert = sqlBuilder.toString();
        int linha = 0;
        try {
            conexao = Conexao.getConexao();

            sql = (PreparedStatement) conexao.prepareStatement(insert);
            sql.setString(1, pessoa.getnome());
            sql.setDate(2, new Date(pessoa.getData_nascimento().getTime()));
            linha = sql.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            fecharConexao();
        }

        return linha;
    }

    public int editar(Pessoa pessoa) {
        
        StringBuilder sqlBuilder = new StringBuilder();
        sqlBuilder
                .append("UPDATE pessoa SET ")
                .append("nome = ?,")
                .append("data_nascimento = ? ")
                .append("WHERE codigo = ?");
        
        String update = sqlBuilder.toString();
        int linha = 0;
        try {
            conexao = Conexao.getConexao();

            sql = (PreparedStatement) conexao.prepareStatement(update);
            sql.setString(1, pessoa.getnome());
            sql.setDate(2, new Date(pessoa.getData_nascimento().getTime()));
            sql.setInt(3, pessoa.getcodigo());
            linha = sql.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            fecharConexao();
        }

        return linha;
    }

    public int apagar(int codigo) {
        StringBuilder sqlBuilder = new StringBuilder();
        sqlBuilder
                .append("DELETE FROM pessoa ")
                .append("WHERE codigo = ?");
        
        String delete = sqlBuilder.toString();
        int linha = 0;
        try {
            conexao = Conexao.getConexao();

            sql = (PreparedStatement) conexao.prepareStatement(delete);
            sql.setInt(1, codigo);
            linha = sql.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            fecharConexao();
        }

        return linha;
    }

    public List<Pessoa> listar() {

        String select = "SELECT * FROM Pessoa";

        List<Pessoa> pessoas = new ArrayList<Pessoa>();

        try {
            conexao = Conexao.getConexao();

            sql = (PreparedStatement) conexao.prepareStatement(select);

            rset = sql.executeQuery();

            while (rset.next()) {

                Pessoa pessoa = new Pessoa();

                pessoa.setnome(rset.getString("nome"));
                pessoa.setData_nascimento(rset.getDate("Data_nascimento"));
                pessoa.setcodigo(rset.getInt("codigo"));

                pessoas.add(pessoa);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            fecharConexao();
        }

        return pessoas;
    }

    private void fecharConexao() {
        try {
            if (rset != null) {
                rset.close();
            }
            if (sql != null) {
                sql.close();
            }

            if (conexao != null) {
                conexao.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
