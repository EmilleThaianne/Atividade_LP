package Veiculo;
import javax.swing.JOptionPane;
public class Principal{
    public static void main(String[] args){
        Carro Veiculo = new Carro();
        boolean parou;
        String resposta;
        
        Veiculo.setModelo(JOptionPane.showInputDialog("Informe o modelo do carro:"));
        Veiculo.setMarca(JOptionPane.showInputDialog("Informe a marca do carro:"));
        Veiculo.setCor(JOptionPane.showInputDialog("Informe a cor do carro:"));
        Veiculo.setAno(Integer.parseInt(JOptionPane.showInputDialog("Informe o ano do carro:")));

        do{resposta = JOptionPane.showInputDialog("Deseja acelerar, reduzir ou freia? Digite 1 para acelerar/ -1 para reduzir / 0 para freiar.");
        parou = Veiculo.Acelera(Integer.parseInt(resposta));
        }while(parou);
        JOptionPane.showMessageDialog(null,Veiculo);
    }
}