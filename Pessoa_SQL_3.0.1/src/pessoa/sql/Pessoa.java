package pessoa.sql;

import java.util.Scanner;
import java.util.Date;

public class Pessoa {

    private int codigo;
    private String nome;
    private Date Data_nascimento;

    public int getcodigo() {
        return codigo;
    }

    public void setcodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getnome() {
        return nome;
    }

    public void setnome(String nome) {
        this.nome = nome;
    }

    public Date getData_nascimento() {
        return Data_nascimento;
    }

    public void setData_nascimento(Date Data_nascimento) {
        this.Data_nascimento = Data_nascimento;
    }

    @Override
    public String toString() {
        return "pesssoa{" + "codigo=" + codigo + ", nome=" + nome + ", data_nascimento=" + Data_nascimento + '}';
    }

}
