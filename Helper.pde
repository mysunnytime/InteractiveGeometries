// Color Controls

color white = #FFFFFF;
color black = #000000;
color pink = #FFCCCC;
color blue = #5F36DE;

color brighten(color c, float d) {
  float r = red(c) + d;
  float g = green(c) + d;
  float b = blue(c) + d;
  c = color(r, g, b);
  return c;
}

color colorTransition(color base, color target, float ratio) {
  float rbase, gbase, bbase, rtarget, gtarget, btarget;
  rbase = red(base);
  gbase = green(base);
  bbase = blue(base);
  rtarget = red(target);
  gtarget = green(target);
  btarget = blue(target);
  float r = abs(rbase - rtarget) <= 1 ? rtarget : map(ratio, 0, 1, rbase, rtarget);
  float g = abs(gbase - gtarget) <= 1 ? gtarget : map(ratio, 0, 1, gbase, gtarget);
  float b = abs(bbase - btarget) <= 1 ? btarget : map(ratio, 0, 1, bbase, btarget);
  return color(r, g, b);
}
