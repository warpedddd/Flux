-- // Table // -- 
getgenv().Triggerbot = {
    Enabled = true,
    Keybind = "V",
    Visuals = true,
    Prediction = 0.11,
    SendNotifications = true
}

-- // Services // --
local G                   = game
local UserInputService    = G:GetService("UserInputService");
local Players      	      = G:GetService("Players");
local Local_Player        = Players.LocalPlayer;
local Get_Mouse_Pos       = Local_Player:GetMouse();
local UserInputService    = game:GetService("UserInputService");
local VirtualInputManager = game:GetService("VirtualInputManager");
local Current_Camera      = G:GetService("Workspace").CurrentCamera;

-- // Variables // --
local Target              = {};
local Triggerbot          = false;
local V2                  = Vector2.new;
local Field_Of_View       = Drawing.new("Circle");

-- // Get Closest Player // --
local GetClosestPlr; GetClosestPlr = function()
    local ClosestTarget = nil;
    local MaxDistance   = math.huge;
    -- // Loops through the player list // --
    for value, index in pairs(Players:GetPlayers()) do
        -- // Excludes the local player from the for loop // --
        if index.Character and index ~= Local_Player and index.Character:FindFirstChild("HumanoidRootPart") then
            -- // Gets distance // --
            local Position, OnScreen = Current_Camera:WorldToScreenPoint(index.Character.HumanoidRootPart.Position)
            local Distance = (V2(Position.X, Position.Y) - V2(Get_Mouse_Pos.X, Get_Mouse_Pos.Y)).Magnitude
            -- // Stops if the player is not OnScreen ( Checks if the pivot is not available ) // --
            if (OnScreen ~= true) then
                continue;
            end
            -- // If the distance is less than math.huge // --
            if (Distance < MaxDistance) then
                MaxDistance = Distance
                ClosestTarget = index
            end
        end
    end
    -- // Returns value // --
    return (ClosestTarget)
end

-- // Get Closest Player In Fov // --
local GetClosestPlr2; GetClosestPlr2 = function()
    local ClosestTarget = nil;
    local MaxDistance   = math.huge;
    -- // Loops through player list // --
    for value, index in pairs(Players:GetPlayers()) do
        -- // Excludes the local player from the for loop // --
        if index.Character and index ~= Local_Player and index.Character:FindFirstChild("HumanoidRootPart") then
            -- // Gets distance // --
            local Position, OnScreen = Current_Camera:WorldToScreenPoint(index.Character.HumanoidRootPart.Position)
            local Distance = (V2(Position.X, Position.Y) - V2(Get_Mouse_Pos.X, Get_Mouse_Pos.Y)).Magnitude
            -- // Stops if the player is not OnScreen ( Checks if the pivot is not available ) // --
            if (OnScreen ~= true) then
                continue;
            end
            -- // If the distance is less than math.huge and the field of view radius is greater than the distance // --
            if (Field_Of_View.Radius > Distance and Distance < MaxDistance) then
                MaxDistance = Distance
                ClosestTarget = index
            end
        end
    end
    -- // Returns value // --
    return (ClosestTarget)
end

-- // Keybind // --
local Toggle; UserInputService.InputBegan:Connect(function(input, Processed)
    if (Processed) then
        -- // Returns nil if already processing // --
        return
    end
    -- // Checks if the key is pressed and if the trigger-bot is enabled // --
    if (input.KeyCode == Enum.KeyCode[getgenv().Triggerbot.Keybind] and getgenv().Triggerbot.Enabled) then
        -- // Each press makes toggle the opposite of the current boolean value // --
        Toggle = not Toggle
        -- // If it is true it turns on the trigger-bot // --
        if (Toggle == true) then
            Triggerbot = true
            -- // Notifies the local player // --
            if (getgenv().Triggerbot.SendNotification) then
                game.StarterGui:SetCore(
                    "SendNotification",
                    {
                        Title = "💰 FlexFlexFlex - Flex Music",
                        Text = "Triggerbot enabled",
                        Icon = "",
                        Duration = 1
                    }
                ) 
            end
        else
            -- // If the toggle is not true it will turn off the trigger-bot // --
            Triggerbot = false
            -- // Notifies the local player // --
            if (getgenv().Triggerbot.SendNotification) then
                game.StarterGui:SetCore(
                    "SendNotification",
                    {
                        Title = "💰 FlexFlexFlex - Flex Music",
                        Text = "Triggerbot disabled",
                        Icon = "",
                        Duration = 1
                    }
                )  
            end
        end
    end
end)

-- // Loop and visuals // --
local Run_Service = G:GetService("RunService"); Run_Service.RenderStepped:Connect(function()
    -- // Calling Get Closest Plr //  --
    Target[1] = GetClosestPlr()
    Target[2] = GetClosestPlr2()

    -- // Field Of View properties https://synapsexdocs.github.io/libraries/drawing/ // --
    Field_Of_View.Radius = 50
    Field_Of_View.Color  = Color3.new(255,255,255)
    Field_Of_View.Filled = false

    -- // Checks if trigger-bot is enabled and a target is found // --
    if (Target[1] and  Target[1].Character and Triggerbot) then
        -- // Variable that determines the position of the closest player // --
        local Position = Current_Camera:WorldToScreenPoint(Target[1].Character.HumanoidRootPart.Position + Target[1].Character.HumanoidRootPart.Velocity * getgenv().Triggerbot.Prediction)
        -- // Sets the position of the field of view as the closest player // --
        Field_Of_View.Position = V2(Position.X, Position.Y + 35)

        -- // If trigger-bot visuals is on the field of view is visible // --
        if (getgenv().Triggerbot.Visuals) then
            Field_Of_View.Visible = true
        end

        -- // If the cursor is inside of the field of view it will start clicking (mouse1press and mouse1click are broken on Solara) // -- 
        if (Target[2] and Target[2].Character) then
            VirtualInputManager:SendMouseButtonEvent(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y, 0, true, game, 1)
            VirtualInputManager:SendMouseButtonEvent(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y, 0, false, game, 1)
        end
    else
        -- // Turns the field of view non-visible if no target is found // --
        Field_Of_View.Visible = false
    end
end)


-- // Made by @wxrpedd // -- 
