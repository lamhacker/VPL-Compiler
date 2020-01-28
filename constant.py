CONST_ASSEM_LABEL = \
"""
.data 
.align 16 
.const{x}:
    .float {x} 
    .float {x} 
    .float {x} 
    .float {x}
"""

CONST_ASSEM_MOVE = \
"""
    # place address of {x} into {destreg}
    movq $.const{x}, {destreg}
"""

class Constant():
    def __init__(self, val):
        self.val = val
		# create label for constant
        self.label = CONST_ASSEM_LABEL.format(x=val)

    def load(self, destreg):
        return CONST_ASSEM_MOVE.format(x=self.val, destreg=destreg)
