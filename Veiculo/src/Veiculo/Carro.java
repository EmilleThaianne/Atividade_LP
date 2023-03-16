package Veiculo;
import javax.swing.JOptionPane;

public class Carro {
    private String Modelo;
    private String Cor;
    private int Ano;
    private String Marca;
    private int Velocidade;

    public Carro(){
    }

    public Carro (String Modelo, String Cor, int Ano, String Marca, int Velocidade){
        this.Modelo = Modelo;
        this.Marca = Marca;
        this.Cor = Cor;
        this.Ano = Ano;
        this.Velocidade = Velocidade;
    }   

    public String getModelo(){
        return Modelo;
    }
    public String getCor(){
        return Cor;
    }
    public int getAno(){
        return Ano;
    }
    public String getMarca(){
        return Marca;
    }
    public int getVelocidade(){
        return Velocidade;
    }
    public void setModelo (String Modelo){
        this.Modelo = Modelo;
    }
    public void setCor (String Cor){
        this.Cor = Cor;
    }
    public void setAno (int Ano){
        this.Ano = Ano;
    }
    public void setMarca (String Marca){
        this.Marca = Marca;
    }
    public void setVelocidade (int Velocidade){
        this.Velocidade = Velocidade;
    }
    public boolean Acelera (int velo){
        if(velo == 1){
            this.Velocidade = this.Velocidade+5; 
             JOptionPane.showMessageDialog(null,"Você acelerou o carro, a velocidade = "+this.Velocidade);
        }else if (velo == -1){
            if(this.Velocidade > 0){
                this.Velocidade = this.Velocidade-5;
            }else{
                this.Velocidade = 0;
            }
            if (this.Velocidade == 0){
                JOptionPane.showMessageDialog(null,"O carro parou ao chegar a 0.0Km/h.");
            } else {
                JOptionPane.showMessageDialog(null,"Você reduziu a velocidade do carro, a velocidade = "+this.Velocidade);
            }
        } else if (velo == 0){
            if (this.Velocidade >= 10){
                JOptionPane.showMessageDialog(null,"Você freiou bruscamente! Está tudo bem?");
                JOptionPane.showMessageDialog(null,"Morra em paz! Deus está contigo");
            }else{
                JOptionPane.showMessageDialog(null,"O carro parou ao chegar a 0.0Km/h.");
            }
            this.Velocidade = 0;
            return false;
        }
        return true;
    }
    @Override 
    public String toString(){
        return "Carro{"+"modelo: "+Modelo+", Cor: "+Cor+ ", Marca: "+Marca+ ", Ano: "+Ano+ ", Velocidade: "+getVelocidade()+"Km/h }";
    }
}
