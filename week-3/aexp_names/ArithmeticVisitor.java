public class ArithmeticVisitor extends ExprNamesBaseVisitor<Integer> {
  @Override
  public Integer visitAtom(ExprNamesParser.AtomContext ctx) {
    return Integer.valueOf(ctx.getText());
  }

  @Override
  public Integer visitBrackets(ExprNamesParser.BracketsContext ctx) {
    return visit(ctx.inner);
  }

  @Override
  public Integer visitMult(ExprNamesParser.MultContext ctx) {
    return visit(ctx.left) * visit(ctx.right);
  }

  @Override
  public Integer visitAdd(ExprNamesParser.AddContext ctx) {
    return visit(ctx.left) + visit(ctx.right);

  }

  @Override
  public Integer visitSub(ExprNamesParser.SubContext ctx) {
    return visit(ctx.left) - visit(ctx.right);
  }
}
