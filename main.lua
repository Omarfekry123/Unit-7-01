-- simple touch code



display.setDefault ( "background", 10/255, 78/255, 221/255 )



local theBall2 = display.newImageRect( "assets/images/secondball.png", 300, 300 )

theBall2.x = display.contentCenterX

theBall2.y = display.contentCenterY

theBall2.id = "ball object"

 

local function onBall2Touched( event )

    if ( event.phase == "began" ) then

        print( "Touch event began on: " .. event.target.id )

        theBall2.y = theBall2.y - 50

    elseif ( event.phase == "ended" ) then

        print( "Touch event ended on: " .. event.target.id )

        theBall2.y = theBall2.y + 50

    end

  

    return true

end



theBall2:addEventListener( "touch", onBall2Touched )



--Comprehensive Touch Event



local theBall = display.newImage( "assets/images/ball.png", 10, 70 )

theBall.x = 160

theBall.y = 40

theBall.id = "ball object"

 

function theBall:touch( event )

    if ( event.phase == "began" ) then

        print( "Touch event began on: " .. self.id )

 

        -- Set touch focus

        display.getCurrentStage():setFocus( self )

        self.isFocus = true

        

        self.markX = self.x

    	self.markY = self.y

     

    elseif ( self.isFocus ) then

        if ( event.phase == "moved" ) then

            print( "Moved phase of touch event detected." )

 			

 			self.x = event.x - event.xStart + self.markX

      		self.y = event.y - event.yStart + self.markY

        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then

 

            -- Reset touch focus

            display.getCurrentStage():setFocus( nil )

            self.isFocus = nil

            print( "Touch event ended on: " .. self.id )

        end

    end



    return true

end



theBall:addEventListener( "touch", theBall )-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here