package escola_Dellficiel;

public class Aluno{

    private int Matricula;
    private String Nome;
    private double NotaProva2;
    private double NotaProva;
    private double NotaTrabalho;

    public Aluno (){

    }
    public Aluno (int Matricula, String Nome, double NotaProva2, double NotaProva, double NotaTrabalho){
        this.Matricula = Matricula;
        this.Nome = Nome;
        this.NotaProva2 = NotaProva2;
        this.NotaProva = NotaProva;
        this.NotaTrabalho = NotaTrabalho;
    }

    public int getMatricula (){
        return Matricula;
    }
    public String getNome(){
        return Nome;
    }
    public double getNotaProva2 (){
        return NotaProva2;
    }
    public double getNotaProva(){
        return NotaProva;
    }
    public double getNotaTrabalho(){
        return NotaTrabalho;
    }

    public void setMatricula (int Matricula){
        this.Matricula = Matricula;
    }

    public void setNome (String Nome){
        this.Nome = Nome;
    }

    public void setNotaProva2 (double NotaProva2){
        this.NotaProva2 = NotaProva2;
    }

    public void setNotaProva (double NotaProva){
        this.NotaProva = NotaProva;
    }

    public void setNotaTrabalho (double NotaTrabalho){
        this.NotaTrabalho = NotaTrabalho;
    }

    public double media(){
        double media = ((NotaProva*2.5 + NotaProva2*2.5 +NotaTrabalho*2.0)/3);
        return media;
    }
    public boolean aprovacao(){
        if (media()>=6.0){
            return true;
        }else {
            return false;
        }
    }
}
