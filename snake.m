clear
clc
playAgain = true;
while playAgain
scene_size = 24;
snake_scene = simpleGameEngine('sprites.png', 16, 16, 8, [245, 245, 245]);

bottom_layer = ones(scene_size,scene_size);
top_layer = ones(scene_size,scene_size);
snake_pos_x = [6,6,6,6];
snake_pos_y = [8,7,6,5];

acceptableInputs = ["uparrow", "rightarrow", "downarrow", "leftarrow",
                    "w", "d", "s", 'a'];
c = 0;
key = "d";
keyInput = "0";
snake_size = size(snake_pos_x, 2);
isHittingTheWall = false;
notDied = true;
applePosX = 1;
applePosY = 1;
youWin = false;

while notDied == true

    % Write snake positions
    for i = 1:snake_size
        top_layer(snake_pos_y(i), snake_pos_x(i)) = 3;
    end

    drawScene(snake_scene, bottom_layer, top_layer)

    % Clear snake positions
    for i = 1:snake_size
        top_layer(snake_pos_y(i), snake_pos_x(i)) = 1;
    end

    keyInput = getKeyboardInput(snake_scene, keyInput);
    %fprintf(keyInput + "\n");

    % Change direction only if keyInput is a valid input
    % The first element in snake_pos should be the head
    % The last element in snake_pos should be the tail
    % During each loop, the tail changes from pos(end) to pos(end - 1)
    % So pos(end) will be a dummy variable. We will use pos(end) to
    % construct the next position of the head.
    % Then use circshift to shift pos(end) to pos(1)
    if ismember(keyInput, acceptableInputs)
        key = keyInput;

        if key == "uparrow" || key == "w"
            if snake_pos_y(1) > 1
                snake_pos_x(end) = snake_pos_x(1);
                snake_pos_y(end) = snake_pos_y(1) - 1;
            else
                isHittingTheWall = true;
            end
        elseif key == "downarrow" || key == "s"
            if snake_pos_y(1) < scene_size
                snake_pos_x(end) = snake_pos_x(1);
                snake_pos_y(end) = snake_pos_y(1) + 1;
            else
                isHittingTheWall = true;
            end
        elseif key == "leftarrow" || key == "a"
            if snake_pos_x(1) > 1
                snake_pos_x(end) = snake_pos_x(1) - 1;
                snake_pos_y(end) = snake_pos_y(1);
            else
                isHittingTheWall = true;
            end
        elseif key == "rightarrow" || key == "d"
            if snake_pos_x < scene_size
                snake_pos_x(end) = snake_pos_x(1) + 1;
                snake_pos_y(end) = snake_pos_y(1);
            else
                isHittingTheWall = true;
            end
        end
         if isHittingTheWall
            notDied = false;
        else
            snake_pos_x = circshift(snake_pos_x, 1);
            snake_pos_y = circshift(snake_pos_y, 1);
        end
    end
    c = c + 1;

    if c == 18
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 36
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 48
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 60
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 72
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 78
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 84
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 90
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 96
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 102
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 108
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
    end
    if c == 114
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
      if c == 120
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
      end
      if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 126
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 132
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 138
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 144
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 150
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 156
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 162
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 168
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 174
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 180
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 186
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 192
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 198
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
        end
    if c == 204
       [applePosY, applePosX] = appleGen();
       top_layer(applePosY, applePosX) = 2;
    end
    if ismember(applePosX, snake_pos_x) && ismember(applePosY, snake_pos_y)
              notDied = false;
              break;
              break;
    end
    if c == 222
        close(snake_scene.my_figure);
        youWin = true;
        notDied = false;
        break;
        
    end
end
   % playAgainScene = sge.createScene('Play Again?');

   % playAgainGraph = sge.createGraph('Play Again? Graph', [0, 1, 2], [0, 1, 4]);
    
   % playAgainGraph.setGraphProperty('title', 'Play Again? Graph');
   % playAgainGraph.setGraphProperty('xAxisLabel', 'X-Axis');
   % playAgainGraph.setGraphProperty('yAxisLabel', 'Y-Axis');
   % playAgainGraph.setGraphProperty('lineColor', [1, 0, 0]);

   %playAgainScene.addGraph(playAgainGraph);
   
   close all;

   if youWin == false
        answer = input("Game Over! Play again? (y for yes and n for no): ", "s");

        if answer == 'n'
            playAgain = false;
        end
   end
   if youWin == true
        answer1 = input("You win! Play again? (y for yes, n for no): ", "s");
        
        if answer1 == 'n'
            playAgain = false;
        end
   end
end