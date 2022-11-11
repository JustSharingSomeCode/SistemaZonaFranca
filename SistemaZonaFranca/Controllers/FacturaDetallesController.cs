﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using SistemaZonaFranca.Models;

namespace SistemaZonaFranca.Controllers
{
    public class FacturaDetallesController : Controller
    {
        private readonly AppDbContext _context;

        public FacturaDetallesController(AppDbContext context)
        {
            _context = context;
        }

        // GET: FacturaDetalles
        public async Task<IActionResult> Index()
        {
            var appDbContext = _context.FacturaDetalles.Include(f => f.Factura).Include(f => f.Inventario);
            return View(await appDbContext.ToListAsync());
        }

        // GET: FacturaDetalles/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.FacturaDetalles == null)
            {
                return NotFound();
            }

            var facturaDetalle = await _context.FacturaDetalles
                .Include(f => f.Factura)
                .Include(f => f.Inventario)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (facturaDetalle == null)
            {
                return NotFound();
            }

            return View(facturaDetalle);
        }

        // GET: FacturaDetalles/Create
        public IActionResult Create()
        {
            ViewData["FacturaId"] = new SelectList(_context.Facturas, "Id", "Estado");
            ViewData["InventarioId"] = new SelectList(_context.Inventarios, "Id", "Descripcion");
            return View();
        }

        // POST: FacturaDetalles/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,FacturaId,InventarioId,Cantidad,SubTotal")] FacturaDetalle facturaDetalle)
        {
            if (ModelState.IsValid)
            {
                _context.Add(facturaDetalle);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["FacturaId"] = new SelectList(_context.Facturas, "Id", "Estado", facturaDetalle.FacturaId);
            ViewData["InventarioId"] = new SelectList(_context.Inventarios, "Id", "Descripcion", facturaDetalle.InventarioId);
            return View(facturaDetalle);
        }

        // GET: FacturaDetalles/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.FacturaDetalles == null)
            {
                return NotFound();
            }

            var facturaDetalle = await _context.FacturaDetalles.FindAsync(id);
            if (facturaDetalle == null)
            {
                return NotFound();
            }
            ViewData["FacturaId"] = new SelectList(_context.Facturas, "Id", "Estado", facturaDetalle.FacturaId);
            ViewData["InventarioId"] = new SelectList(_context.Inventarios, "Id", "Descripcion", facturaDetalle.InventarioId);
            return View(facturaDetalle);
        }

        // POST: FacturaDetalles/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,FacturaId,InventarioId,Cantidad,SubTotal")] FacturaDetalle facturaDetalle)
        {
            if (id != facturaDetalle.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(facturaDetalle);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!FacturaDetalleExists(facturaDetalle.Id))
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
            ViewData["FacturaId"] = new SelectList(_context.Facturas, "Id", "Estado", facturaDetalle.FacturaId);
            ViewData["InventarioId"] = new SelectList(_context.Inventarios, "Id", "Descripcion", facturaDetalle.InventarioId);
            return View(facturaDetalle);
        }

        // GET: FacturaDetalles/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.FacturaDetalles == null)
            {
                return NotFound();
            }

            var facturaDetalle = await _context.FacturaDetalles
                .Include(f => f.Factura)
                .Include(f => f.Inventario)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (facturaDetalle == null)
            {
                return NotFound();
            }

            return View(facturaDetalle);
        }

        // POST: FacturaDetalles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.FacturaDetalles == null)
            {
                return Problem("Entity set 'AppDbContext.FacturaDetalles'  is null.");
            }
            var facturaDetalle = await _context.FacturaDetalles.FindAsync(id);
            if (facturaDetalle != null)
            {
                _context.FacturaDetalles.Remove(facturaDetalle);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool FacturaDetalleExists(int id)
        {
          return _context.FacturaDetalles.Any(e => e.Id == id);
        }
    }
}
