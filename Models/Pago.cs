using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace albanaPlayaEst.Models
{
    public partial class Pago
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int? cod_Pag { get; set; } // Clave primaria del pago

        [Required(ErrorMessage = "El monto del pago es obligatorio.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "El monto debe ser un valor positivo.")]
        public decimal MontPag { get; set; } // Monto del pago

        [Required(ErrorMessage = "El código del método de pago es obligatorio.")]
        public int CodMetd { get; set; } // Clave del método de pago

        // Nuevo campo: Fecha de inicio del pago mensual
        public DateTime? FechaInicio { get; set; }

        // Nuevo campo opcional: Fecha de fin del plan de pagos
        public DateTime? FechaFin { get; set; } 

        // Indica si este pago es recurrente (por ejemplo, mensual)
        public bool EsPagoRecurrente { get; set; } = false;
        public bool Estado { get; set; } = false; // Estados: "Pendiente", "Pagado", "Fallido"
        // Propiedad de navegación hacia el método de pago
        public virtual Metodpag CodMetdNavigation { get; set; }

        // Propiedad de navegación uno a muchos: un pago puede cubrir varios registros
        public virtual ICollection<Registro> Registros { get; set; } = new List<Registro>();
    }
}

