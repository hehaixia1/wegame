import Felgo 3.0
import QtQuick 2.0


Item {


    id: gameArea
    width: blockSize * 8
    height: blockSize * 12

    property double blockSize
    property int rows:Math.floor(height/blockSize)
    property int columns:Math.floor(width/blockSize)

    property var field:[]

    //增加难度的相关参数
    property int maxTypes
    property int clicks


    signal gameOver()

    //淡入/淡出动画
    Behavior on opacity {
        NumberAnimation {duration: 400 }
    }


    //计算字段索引
    function index(row,column)
    {
        return row * columns + column
    }

    //对游戏场景初始化
    function initializeField(){

        gameArea.clicks = 0
        gameArea.maxTypes = 3

        //清栏
         clearField()

        for(var i =0;i < rows;i++){
            for(var j =0;j <columns;j++){
                gameArea.field[index(i,j)] = createBlock(i,j)
            }
        }
    }

    // 清除游戏场地
    function clearField(){
        for(var i = 0;i <gameArea.field.length;i++){
            var block = gameArea.field[i]
            if(block !== null){
                entityManager.removeEntityById(block.entityId)
            }
        }
        gameArea.field = []
    }
    //产生实体块在指定位置
    function createBlock(row,column){
        var entityProperties = {
            width:blockSize,
            height:blockSize,
            x:column * blockSize,
            y:row * blockSize,

            type:Math.floor(Math.random() *  gameArea.maxTypes),// 水果随机产生
            row:row,
            column:column
        }

        //增加实体块到界面
        var id  =  entityManager.createEntityFromUrlWithProperties(
                    Qt.resolvedUrl("Block.qml"),entityProperties)

        //此字符串属性持有实体的唯一标识符
        var entity = entityManager.getEntityById(id)
        entity.clicked.connect(handleClick)

        return entity
    }
    //用户点击处理
    function handleClick(row,column,type){
        if(!isFieldReadyForNewBlockRemoval())
            return
        var fieldCopy = field.slice()
        var blockCount = getNumberOfConnectedBlocks(fieldCopy,row,column,type)
        if(blockCount >= 3){
            removeConnectedBlocks(fieldCopy)
            //此函数是把高处的块向下移动
            moveBlocksToBottom()
            //消去一次的分素

            var score = blockCount * (blockCount + 1) / 2
            scene.score +=score

            //游戏分数的存储
            gameScore.score=scene.score
            gameScore.save()

            if(isGameOver())
                gameOver()

            //增加游戏难度

            gameArea.clicks++
            if((gameArea.maxTypes < 5) && (gameArea.clicks % 10 == 0))
                gameArea.maxTypes++
        }

    }
    //
    function isFieldReadyForNewBlockRemoval(){
        for(var col = 0; col < columns;col++){
            var block = field[index(0,col)]
            if(block === null || block.y < 0)
                return false
        }

        return true
    }

    //检查游戏是否结束
    function isGameOver(){
        var gameOver = true

        var fieldCopy = field.slice()

        for(var row = 0; row < rows;row++){
            for(var col = 0;col < columns;col++){
                var block = fieldCopy[index(row,col)]
                if(block !== null){
                var blockCount = getNumberOfConnectedBlocks(fieldCopy,row,col,block.type)

                if(blockCount >= 3){
                    gameOver = false
                    break
                    }
                }
            }
        }
        return gameOver
    }

    //将剩余的块移到底部，用新的块填充列
    function moveBlocksToBottom(){
        for(var col = 0; col < columns;col++){
            for(var row = rows - 1;row >= 0;row--){
                if(gameArea.field[index(row,col)] === null){
                    var moveBlock = null
                    for( var moveRow = row - 1;moveRow >= 0;moveRow--){
                        moveBlock = gameArea.field[index(moveRow,col)]

                        if(moveBlock !== null){
                            gameArea.field[index(moveRow,col)] = null
                            gameArea.field[index(row,col)] = moveBlock
                            moveBlock.row = row
                            moveBlock.y = row *gameArea.blockSize
                            break
                        }
                    }
                    if(moveBlock === null){
                        for(var newRow = row;newRow >= 0;newRow--){
                            var newBlock = createBlock(newRow,col)
                            gameArea.field[index(newRow,col)] = newBlock
                            newBlock.row = newRow
                            newBlock.y = newRow * gameArea.blockSize
                        }
                        break
                    }
                }
            }
        }
    }

    //返回需要消去水果块数
    //实现的是消去水果的逻辑
    function getNumberOfConnectedBlocks(fieldCopy,row,column,type){
        if(row >= rows || column >= columns || row < 0 || column < 0)
            return 0
        var block= fieldCopy[index(row,column)]

        if(block === null)
            return 0
        if(block.type !==type)
            return 0
        var count = 1

        fieldCopy[index(row,column)] = null

        count += getNumberOfConnectedBlocks(fieldCopy,row + 1,column,type)
        count += getNumberOfConnectedBlocks(fieldCopy,row,column + 1,type)
        count +=getNumberOfConnectedBlocks(fieldCopy,row - 1,column,type)
        count +=getNumberOfConnectedBlocks(fieldCopy,row,column - 1,type)

        return count
    }
    //删除以前标记的块
    function removeConnectedBlocks(fieldCopy){
        for(var i = 0;i < fieldCopy.length;i++){
            if(fieldCopy[i] === null){
                var block = gameArea.field[i]
                if(block !== null){

                    gameArea.field[i] = null
                    entityManager.removeEntityById(block.entityId)


                }


            }

        }



    }

}
