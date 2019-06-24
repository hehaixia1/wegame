import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.0

Item {
    id: sound
    Audio {
      id: fruitClear
      autoPlay: false
      source: "../../assets/music/NFF-fruit-collected.wav"
    }
    function playFruitClear() { fruitClear.stop(); fruitClear.play() }

}
