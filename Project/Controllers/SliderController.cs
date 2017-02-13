using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using SistemiEvaluation.Data.Abstract;
using SistemiEvaluation.Models;
using SistemiEvaluation.Entities;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using System.IO;
using Microsoft.AspNetCore.Hosting;

// For more information on enabling Web API for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemiEvaluation.API.Controllers
{
    //[Route("api/[controller]")]
    [Route("api/slider")]
    public class SlidesController : Controller
    {
        private ISliderRepository _sliderRepository;
        private IHostingEnvironment _env;

        //int page = 1;
        //int pageSize = 10;
        public SlidesController(ISliderRepository sliderRepository, IHostingEnvironment env)
        {
            _sliderRepository = sliderRepository;
            _env = env;
        }

        [HttpGet]
        public IActionResult Get()
        {
            IEnumerable<Slider> _items = _sliderRepository
                   .GetAll()
                   .ToList();

            IEnumerable<SliderVM> _sliderVM = Mapper.Map<IEnumerable<SliderVM>>(_items);

            //Response.AddPagination(page, pageSize, totalUsers, totalPages);

            return new OkObjectResult(_sliderVM);
        }

        [HttpGet("{id}", Name = "GetCategory")]
        public IActionResult Get(int id)
        {
            Slider _category = _sliderRepository.GetSingle(u => u.Id == id);

            if (_category != null)
            {
                SliderVM _categoryVM = Mapper.Map<SliderVM>(_category);
                return new OkObjectResult(_categoryVM);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpPost]
        public IActionResult Create(SliderUploadVM SliderUploadVM, IFormFile file)
        {
            
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (file == null || file.Length == 0) {
                return BadRequest("Your file was not valid!");
            }
            using (Stream stream = file.OpenReadStream())
            {
                using (BinaryReader br = new BinaryReader(stream))
                {
                    var fileContent = br.ReadBytes((int)file.Length);
                    SliderUploadVM.Image =SaveFileHelper.SaveFileToDisk(_env,fileContent, file.FileName, file.ContentType);
                }
            }
                Slider _newSlider = Mapper.Map<Slider>(SliderUploadVM);

            _sliderRepository.Add(_newSlider);
            _sliderRepository.SaveChanges();

            CreatedAtRouteResult result = CreatedAtRoute("GetCategory", new { controller = "Categories", id = SliderUploadVM.Id }, SliderUploadVM);
            return result;
        }


        [HttpPut]
        public IActionResult Update(SliderUploadVM SliderUploadVM, IFormFile file)
        {
       
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            if (file != null) 
            {
                using (Stream stream = file.OpenReadStream())
                {
                    using (BinaryReader br = new BinaryReader(stream))
                    {
                        var fileContent = br.ReadBytes((int)file.Length);
                        SliderUploadVM.Image = SaveFileHelper.SaveFileToDisk(_env, fileContent, file.FileName, file.ContentType);
                    }
                }
            }         
            
            Slider _sliderDb = _sliderRepository.GetSingle(SliderUploadVM.Id);

            if (_sliderDb == null)
            {
                return NotFound();
            }

            Mapper.Map(SliderUploadVM, _sliderDb);

            _sliderRepository.SaveChanges();

            return new NoContentResult();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            Slider _categoryDb = _sliderRepository.GetSingle(id);

            if (_categoryDb == null)
            {
                return new NotFoundResult();
            }
            else
            {
                _sliderRepository.Delete(_categoryDb);

                _sliderRepository.SaveChanges();

                return new NoContentResult();
            }
        }
    }
}
