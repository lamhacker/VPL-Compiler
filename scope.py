class Scope():
	# Create scope to fit block structure
    def __init__(self, stmt):
        self.prev = None
        self.nexts = []
        self.assem = ""
		# stmt can be function / if / while statement
        self.stmt = stmt
        self.bind = None

	# add a nested scope 
    def addNext(self, stmt):
        scope = Scope(stmt)
        self.nexts.append(scope)
        scope.prev = self

        return scope

	# end the nested scope and return the parent scope
    def endScope(self):
        if self.prev is None:
            pass
        
        self.prev.assem += str(self)
        return self.prev
    
	# bind input of assemble code into specific field in that scope
    def bindScope(self, field):
        if self.stmt.__class__.__name__ != "WhileStatement":
            return     
        self.bind = self.stmt.getCondExpr(field)

	# cancel bind effect and input assemble code into general body of scope
    def unbindScope(self):
        self.stmt.setCondExpr(self.bind)
        self.bind = None

	# add assemble code into scope
    def addAssem(self, newAssem):
		# if no field specific, add assemble code to body of scope
        if self.bind is None:
            self.assem += newAssem
        else:
            self.bind += newAssem

    def __str__(self):
        return self.stmt.getAssem(self.assem)
    
