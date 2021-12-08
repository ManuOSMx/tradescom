/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ipn.escom.manejo;

import java.io.Serializable;

import ipn.escom.entidades.DarRecibir;

/**
 *
 * @author jemil
 */
public class DarRecibirDTO implements Serializable{
    private DarRecibir entidad;

    public DarRecibirDTO() {
        entidad = new DarRecibir();
    }

    public DarRecibir getEntidad() {
        return entidad;
    }

    public void setEntidad(DarRecibir entidad) {
        this.entidad = entidad;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("idRegalo : ").append(getEntidad().getIdRegalo()).append("\n");
        sb.append("idDar: ").append(getEntidad().getIdDar()).append("\n");
        sb.append("idRecibir : ").append(getEntidad().getIdRecibir()).append("\n");
        sb.append("idInter : ").append(getEntidad().getIdInter()).append("\n");
        return sb.toString();
    }
    
}
