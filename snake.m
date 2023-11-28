scene_size = 24;
snake_scene = simpleGameEngine('sprites.png', 16, 16, 8, [245, 245, 245]);

bottom_layer = ones(scene_size,scene_size);
top_layer = ones(scene_size,scene_size);
snake_pos_x = [6,6,6,6];
snake_pos_y = [8,7,6,5];

acceptableInputs = ["uparrow", "rightarrow", "downarrow", "leftarrow",
                    "w", "d", "s", 'a'];

key = "d";
keyInput = "0";
snake_size = size(snake_pos_x, 2);
isHittingTheWall = false;
while true

    % Write snake positions
    for i = 1:snake_size
        top_layer(snake_pos_y(i), snake_pos_x(i)) = 285;
    end

    drawScene(snake_scene, bottom_layer, top_layer)

    % Clear snake positions
    for i = 1:snake_size
        top_layer(snake_pos_y(i), snake_pos_x(i)) = 1;
    end

    keyInput = getKeyboardInput(snake_scene, keyInput);
    fprintf(keyInput + "\n");

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
            isHittingTheWall = false;
        else
            snake_pos_x = circshift(snake_pos_x, 1);
            snake_pos_y = circshift(snake_pos_y, 1);
        end
    end
    if applePosX == snake_pos_x && applePosY == snake_pos_y 
        break
    end
    if isHittingTheWall
        break
    end
end

% Load sprite sheet
spriteSheetImage = imread('spritesheet.png');

% Create red sprites
redSpriteImage = spriteSheetImage(1:24, 1:24, :);
redSprite = sge.createSprite(redSpriteImage);

% Draw red sprites
for i = 1:25
    for j = 1:25
        sge.addSprite(redSprite, 24 * (i - 1), 24 * (j - 1));
    end
end
