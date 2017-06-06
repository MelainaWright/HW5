#' Pb
#'
#' This function computes automobile fuel efficiency is as the power required to keep a car moving at a given speed
#' @param m mass of car inkg
#' @param V velocity of car in m/s
#' @param A surface area of car in m2
#' @param cRolling rolling aerodynamic resistive coefficient, default is 0.015
#' @param cDrag drag aerodynamic resistive coefficient, default is 0.3
#' @param pAir density of air, default is 1.2kg/m3
#' @param g acceleration due to gravity is 9.8m/s2
#' @examples Pb(31752, 20, 60)
#' @author Melaina Wright
#' @return Power


Pb = function(m, V, A, cRolling=0.015, cDrag=0.3, pAir=1.2, g=9.8) {
  Pb = cRolling*m*g*V + (0.5*A)*pAir*cDrag*(V^3)
  return(Pb)
}
