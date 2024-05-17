								-- // Table Variables // --
								local ES  = Enum.EasingStyle;
								local ED  = Enum.EasingDirection;
								local C3  = Color3.new;
								local V3  = Vector3.new;
								local V2  = Vector2.new;
								local On  = true;
								local Off = false;

								-- // Distances (Studs) // --
								local VeryNear, Near, Mid, Far, VeryFar, ExtremelyFar = 50, 100, 150, 200, 250, 300;

								-- // Settings // --
								local Settings = nil Settings = {
									UncapFps        = On;
									FpsCap          = math.huge; -- math.huge or 0 for uncapped
									Threading       = "Heartbeat";
								};

								local Flux = nil; Flux = -- // Not gonna using getgenv lame ass boy 
								{
									Aiming =
									{
										Global = { -- Anti aim viewer automatically on
											Resolver  = On;
											Notify    = On;
											Wall      = On;
											Dead      = {Self = On; Target = On;};

											Reloading = On;
											Grabbed   = On;
											Team      = Off;
											Visible   = On;
										};

										 -- // Aim Assist // --
										AimAssist = {
											Enabled         = On;                   -- [Boolean]
											Bind            = "C";                  -- [String]
											UseEasing       = On;                   -- [Boolean]
											UseJitter       = Off;                  -- [Boolean]
											DahoodMode      = On;                   -- [Boolean]
											EasingStyle     = ES.Bounce;            -- [https://create.roblox.com/docs/reference/engine/enums/EasingStyle]
											EasingDirection = ED.InOut;             -- [https://create.roblox.com/docs/reference/engine/enums/EasingDirection]

											HitPart         = "HumanoidRootPart";   -- [String]

											FOV = {
												-- // Circle // --
												Show         = Off;            -- [Boolean]

												-- // Properties // --
												Sides        = math.huge;      -- math.huge == any greater or equal to 2 to the power of 1024 minus 1  -- [Integer]
												Size         = 170;            -- [Integer]
												Fill         = On;             -- [Boolean]

												Color        = 255, 255, 255;  -- [Color3]	
												Thickness    = 1;              -- [Integer]
												Transparency = .3;            -- [Decimal]
											};

											Offset = {
												Humanize = {
													Enabled = Off;
													Factor  = {Enabled = Off; Value = 3; Randomize = Off; Randomization = 3,3};
	
													X = {
														[1] = 3;
														[2] = 3;
													};
	
													Y = {
														[1] = 8;
														[2] = 8;
													};
	
													Z = {
														[1] = 2;
														[2] = 2;
													};
												};
											};

											Smoothness = {
												X = {
													Value = 0.09;
												};

												Y = {
													Value = 0.1;
												};
											};

											Prediction = {
												Mode        = "V3";                -- [STRING] (V2 or V3)
												[1]         = .1815;               -- (X AXIS) - [Decimal]
												[2]         = .069;                -- (Y AXIS) - [Decimal]
												[3]         = .1815;               -- (Z AXIS) - [Decimal]  NOTE: If V2 is on this wont apply
											};

											AutomatedPred = {
												Enabled = On;                       -- [Boolean]
												Math    = "";                       -- // Math.Floor or Math.Round or None
												Axis    = "X, Z";                   -- Axis all axises = X Y Z (has to be capital btw)
											};
										};

										 -- // Bullet Redirection    // --
										SilentAim = {
											Enabled         = On;                   -- [Boolean]
											UseBind         = On;                   -- [Boolean]
											Bind            = "P";                  -- (https://create.roblox.com/docs/reference/engine/enums/KeyCode - [String])

											HitPart         = "HumanoidRootPart";   -- [String]

											ClosestPart     = Off;                  -- [Boolean]
											ClosestPoint    = On;                   -- [Boolean]

											FOV = {
												-- // Circle // --
												Show         = On;            -- [Boolean]

												-- // Properties // --
												Sides        = math.huge;      -- math.huge == any greater or equal to 2 to the power of 1024 minus 1  -- [Integer]
												Size         = 170;            -- [Integer]
												Fill         = On;             -- [Boolean]

												Color        = 255, 255, 255;  -- [Color3]
												Thickness    = 1;              -- [Integer]
												Transparency = .3;            -- [Decimal]

												-- // Legit Features ( Range Coefficient Only Applies to Fov Type 3 // --
												Mode = { StickFov = Off; FovType3 = Off; FovType3Amount = V3( .95, .086, .095 ); RangeCoefficent = 1000 };   -- These are not added **I CBA**
											};

											Prediction = {
												Mode        = "V3";                -- [STRING] (V2 or V3)
												[1]         = .1815;               -- (X AXIS) - [Decimal]
												[2]         = .069;                -- (Y AXIS) - [Decimal]
												[3]         = .1815;               -- (Z AXIS) - [Decimal]  NOTE: If V2 is on this wont apply
											};

											AutomatedPred = {
												Enabled = On;                       -- [Boolean]
												Math    = "";                       -- // Math.Floor or Math.Round or None
												Axis    = "X, Z";                   -- Axis all axises = X Y Z (has to be capital btw)
											};

											-- // Offsets // --
											Offset = {
												Humanize = {
													Enabled = Off;
													Factor  = {Enabled = Off; Value = 3; Randomize = Off; Randomization = 3,3};
	
													X = {
														[1] = 3;
														[2] = 3;
													};
	
													Y = {
														[1] = 8;
														[2] = 8;
													};
	
													Z = {
														[1] = 2;
														[2] = 2;
													};
												};
											};

											Range = {
												Enabled       = Off;
												UsePrediction = Off;

												VeryNear = {Fov = 60; PredictionX  = .1815; PredictionY  = .067; PredictionZ  = .1815};

												Near = {Fov = 50;  PredictionX  = .1816; PredictionY  = .067; PredictionZ  = .1816};

												Mid = {Fov = 30; PredictionX  = .1821; PredictionY  = .067; PredictionZ  = .1821};

												Far = {Fov = 15; PredictionX  = .1831; PredictionY  = .067; PredictionZ  = .1831};

												VeryFar = {Fov = 10; PredictionX  = .1841; PredictionY  = .067; PredictionZ  = .1841};

												ExtremelyFar = {Fov = 6; PredictionX  = .1851; PredictionY  = .067; PredictionZ  = .1851};
											};
										};
									};

									Misc = {
										Intro = {
											Enabled  = On;
											Duration = 5; -- seconds
										};

										Macro = {
											Enabled     = On;                       -- [Boolean]
											Bind        = "X";                      -- [String]
											Type        = "3rd";                    -- [String]
											Delay       = 10;                       -- [Integer]
										};

										Sorter = {
											Enabled = On;                           -- [Boolean]
											Keybind = "L";                          -- [String]
											Slot1   = "[Double-Barrel SG]";         -- [String]
											Slot2   = "[Revolver]";                 -- [String]
											Slot3   = "[TacticalShotgun]";          -- [String]
											Slot4   = "[Cranberry]";                -- [String]
											Slot5   = "[Chicken]";                  -- [String]
											Slot6   = "[Pizza]";                    -- [String]
											Slot7   = "[Taco]";                     -- [String]
											Slot8   = "[Milk]";                     -- [String]
											Slot9   = "[Hamburger]";                -- [String]
											Slot0   = "";                           -- [String]

											Remove  = {
												Items = {"[Wallet]", "[Phone]", "[Boombox]"}
											};
										};

										Color = {
											Enabled         = On;                   -- [Boolean]
											Brightness      = .1;                  -- [Integer]
											Contrast        = .06;                 -- [Integer]
											Saturation      = .9;                  -- [Integer]
										};

										Texture = {
											Enabled  = Off;
											Material = "Granite";
											Affect   = "MeshPart", "Part";
											Color    = {Enabled = Off; Value = C3(255,255,255)}
										};
									};
								};
