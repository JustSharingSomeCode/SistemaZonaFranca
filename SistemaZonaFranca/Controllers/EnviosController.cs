using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using SistemaZonaFranca.Models;

namespace SistemaZonaFranca.Controllers
{
    public class EnviosController : Controller
    {
        private readonly AppDbContext _context;

        public EnviosController(AppDbContext context)
        {
            _context = context;
        }

        // GET: Envios
        public async Task<IActionResult> Index()
        {
            var appDbContext = _context.Envios.Include(e => e.CiudadDestino).Include(e => e.CiudadOrigen).Include(e => e.Factura);
            return View(await appDbContext.ToListAsync());
        }

        // GET: Envios/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Envios == null)
            {
                return NotFound();
            }

            var envio = await _context.Envios
                .Include(e => e.CiudadDestino)
                .Include(e => e.CiudadOrigen)
                .Include(e => e.Factura)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (envio == null)
            {
                return NotFound();
            }

            return View(envio);
        }

        // GET: Envios/Create
        public IActionResult Create()
        {
            ViewData["CiudadDestinoId"] = new SelectList(_context.Ciudades, "Id", "Nombre");
            ViewData["CiudadOrigenId"] = new SelectList(_context.Ciudades, "Id", "Nombre");
            ViewData["FacturaId"] = new SelectList(_context.Facturas, "Id", "Estado");
            return View();
        }

        // POST: Envios/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,FacturaId,CiudadOrigenId,DireccionOrigen,CiudadDestinoId,DireccionDestino,FechaEntrega,Estado")] Envio envio)
        {
            if (ModelState.IsValid)
            {
                _context.Add(envio);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CiudadDestinoId"] = new SelectList(_context.Ciudades, "Id", "Nombre", envio.CiudadDestinoId);
            ViewData["CiudadOrigenId"] = new SelectList(_context.Ciudades, "Id", "Nombre", envio.CiudadOrigenId);
            ViewData["FacturaId"] = new SelectList(_context.Facturas, "Id", "Estado", envio.FacturaId);
            return View(envio);
        }

        // GET: Envios/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Envios == null)
            {
                return NotFound();
            }

            var envio = await _context.Envios.FindAsync(id);
            if (envio == null)
            {
                return NotFound();
            }
            ViewData["CiudadDestinoId"] = new SelectList(_context.Ciudades, "Id", "Nombre", envio.CiudadDestinoId);
            ViewData["CiudadOrigenId"] = new SelectList(_context.Ciudades, "Id", "Nombre", envio.CiudadOrigenId);
            ViewData["FacturaId"] = new SelectList(_context.Facturas, "Id", "Estado", envio.FacturaId);
            return View(envio);
        }

        // POST: Envios/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,FacturaId,CiudadOrigenId,DireccionOrigen,CiudadDestinoId,DireccionDestino,FechaEntrega,Estado")] Envio envio)
        {
            if (id != envio.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(envio);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!EnvioExists(envio.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["CiudadDestinoId"] = new SelectList(_context.Ciudades, "Id", "Nombre", envio.CiudadDestinoId);
            ViewData["CiudadOrigenId"] = new SelectList(_context.Ciudades, "Id", "Nombre", envio.CiudadOrigenId);
            ViewData["FacturaId"] = new SelectList(_context.Facturas, "Id", "Estado", envio.FacturaId);
            return View(envio);
        }

        // GET: Envios/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Envios == null)
            {
                return NotFound();
            }

            var envio = await _context.Envios
                .Include(e => e.CiudadDestino)
                .Include(e => e.CiudadOrigen)
                .Include(e => e.Factura)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (envio == null)
            {
                return NotFound();
            }

            return View(envio);
        }

        // POST: Envios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Envios == null)
            {
                return Problem("Entity set 'AppDbContext.Envios'  is null.");
            }
            var envio = await _context.Envios.FindAsync(id);
            if (envio != null)
            {
                _context.Envios.Remove(envio);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool EnvioExists(int id)
        {
          return _context.Envios.Any(e => e.Id == id);
        }
    }
}
