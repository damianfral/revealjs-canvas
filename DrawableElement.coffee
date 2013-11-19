class DrawableElement

	### 
	@param {canvasEl} DOMElement
	###
	constructor: (@canvasEl) ->
		# Canvas
		@canvasEl.style.width  = "1600"
		@canvasEl.style.height = "900"
		@canvasEl.width  = "1600"
		@canvasEl.height = "900"

		@ctx             = @canvasEl.getContext "2d"
		@ctx.lineWidth   = 5
		@ctx.lineJoin    = 'round'
		@ctx.lineCap     = 'round'
		@ctx.strokeStyle = 'red'
		
		@canvasEl.addEventListener "mousedown", @startPaint 
	

		@mousePos     = [0, 0]

	### 
	@param e 		DOMEvent

	@return {Array} Current mouse position.
	###
	getCursorPosition: (e) =>
		@lastMousePos = @mousePos.slice 0
		rect          = @canvasEl.getBoundingClientRect();

		@mousePos = [e.clientX - rect.left, e.clientY - rect.top]
		return @mousePos


	startPaint: (e) =>
		@lastMousePos = @getCursorPosition e
		@canvasEl.addEventListener "mousemove", @paint
		@canvasEl.addEventListener "mouseup", @stopPaint


	paint: (e) =>
		position = @getCursorPosition e
		do @ctx.beginPath
		@ctx.moveTo @lastMousePos[0], @lastMousePos[1]
		@ctx.lineTo @mousePos[0], @mousePos[1]
		do @ctx.closePath
		do @ctx.stroke

	stopPaint: (e) =>
		@canvasEl.removeEventListener "mousemove", @paint

window.DrawableElement = DrawableElement