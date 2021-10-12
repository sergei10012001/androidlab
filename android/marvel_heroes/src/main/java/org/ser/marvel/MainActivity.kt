package org.ser.marvel

import android.animation.ArgbEvaluator
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import org.ser.marvel.R
import org.ser.marvel.heroes.adapter.HeroAdapter
import org.ser.marvel.heroes.HeroesDataset
import org.ser.marvel.heroes.model.Hero
import org.ser.marvel.custromViewes.TriangleView
import com.yarolegovich.discretescrollview.DiscreteScrollView
import com.yarolegovich.discretescrollview.transform.Pivot
import com.yarolegovich.discretescrollview.transform.ScaleTransformer
import kotlin.math.abs


class MainActivity : AppCompatActivity(),
    DiscreteScrollView.OnItemChangedListener<HeroAdapter.HeroHolder>,
    DiscreteScrollView.ScrollListener<HeroAdapter.HeroHolder> {

    private val heroes = HeroesDataset().getHeroes()
    private var triangle: TriangleView? = null
    private var evaluator: ArgbEvaluator? = null


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        evaluator = ArgbEvaluator()
        triangle = findViewById(R.id.triangle)

        val heroesScrollView = findViewById<DiscreteScrollView>(R.id.picker)

        heroesScrollView.adapter = HeroAdapter(heroes)
        heroesScrollView.addOnItemChangedListener(this)
        heroesScrollView.addScrollListener(this)
        heroesScrollView.setItemTransformer(
            ScaleTransformer.Builder()
                .setMinScale(0.85f)
                .setMaxScale(1f)
                .setPivotX(Pivot.X.CENTER)
                .setPivotY(Pivot.Y.CENTER)
                .build()
        )

        itemChange(heroes[0])
    }

    private fun itemChange(hero: Hero) {
        triangle?.colorPaint = hero.color
        triangle?.invalidate()
    }

    override fun onCurrentItemChanged(viewHolder: HeroAdapter.HeroHolder?, adapterPosition: Int) {
        itemChange(heroes[adapterPosition])
    }

    override fun onScroll(
        scrollPosition: Float,
        currentPosition: Int,
        newPosition: Int,
        currentHolder: HeroAdapter.HeroHolder?,
        newCurrent: HeroAdapter.HeroHolder?
    ) {
        val prevHero = heroes[currentPosition]
        val hero = heroes[newPosition]
        triangle?.colorPaint = interpolate(abs(scrollPosition), prevHero.color, hero.color)
        triangle?.invalidate()
    }

    private fun interpolate(fraction: Float, point1: Int, point2: Int): Int {
        return evaluator?.evaluate(fraction, point1, point2) as Int
    }
}