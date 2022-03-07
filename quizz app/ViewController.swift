
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var preguntaLbl: UILabel!
    @IBOutlet weak var verdaderoBoton: UIButton!
    @IBOutlet weak var falsoBoton: UIButton!
    @IBOutlet weak var barraProgreso: UIProgressView!
    
    
    var numPregunta = 0;
    let preguntas = [
        ["Diez mas diez es 20", "VERDADERO"],
        ["El ITM es la mejor escuela","VERDADERO"],
        ["el america es el mejor equipo de mexico","VERDADERO"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
    }
    
    @IBAction func respuestaBtn(_ sender: UIButton) {
        if numPregunta < preguntas.count{
            print("Boton presionado \(sender.currentTitle)")
            let respuestaUsuario = sender.currentTitle
            let respuestaCorrecta = preguntas[numPregunta][1]
        
            if respuestaUsuario == respuestaCorrecta{
                print("respuesta correcta")
            }else{
                print("respuesta incorrecta")
            }
            //cambiar de pregunta
            preguntaLbl.text = preguntas[numPregunta][0]
            numPregunta += 1
        }else{
            numPregunta=0
        }
    }
}

